# Maintainer: José Ferreira <jose.filipe.matos.ferreira@gmail.com>

pkgname=thonkbar-git
pkgver=r18.873a964
pkgrel=1
pkgdesc="minimalist block based lemonbar wrapper"
arch=('any')
url="https://github.com/JoseFilipeFerreira/${pkgname%-git}"
license=('GPL')
makedepends=(git gcc)
depends=(lemonbar-xft-git)
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit
    make DESTDIR="$pkgdir/" install
}

# vim: ts=2 sw=2 et ft=sh:
