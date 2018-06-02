# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite-git"
pkgver=r45.ece430f
pkgrel=6
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
conflicts=('sodalite')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-urwid' 'python-yaml' 
'python-pyperclip' 'python-pygments' 'xdg-utils')
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
