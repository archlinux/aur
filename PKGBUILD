# Maintainer: Dylan Araps <dylan.araps@gmail.com>
pkgname=promptless
_pkgname=promptless
pkgver=1.0.2
pkgrel=1
pkgdesc="A super fast and extremely minimal shell prompt."
arch=('any')
url="https://github.com/dylanaraps/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=()
optdepends=()
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/promptless.git")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
    cd "$pkgname"
    install -D -m755 promptless.sh "$pkgdir/usr/bin/promptless.sh"
}

post_install() {
    echo
    echo "add 'promptless.sh' to your .bashrc or equivalent."
    echo
}
