# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite-git"
pkgver=r87.89f52c4
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
conflicts=('sodalite')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-urwid' 'python-yaml')
source=('git+https://github.com/hnicke/sodalite.git')
md5sums=('SKIP')
install=sodalite.install

_gitroot=https://github.com/hnicke/sodalite.git
_gitname=sodalite

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/$_gitname"
    echo pkgdir is $pkgdir
    FAKE_ROOT=$pkgdir ./install
}
