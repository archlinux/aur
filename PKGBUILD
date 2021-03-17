# Maintainer: José Ferreira <jose.filipe.matos.ferreira@gmail.com>
pkgname=thonkbar-git
pkgver=r20.207d3cb
pkgrel=1
pkgdesc="minimalist block based lemonbar wrapper"
arch=('any')
url="https://github.com/JoseFilipeFerreira/${pkgname%-git}"
license=('GPL3')
makedepends=(git gcc)
depends=(lemonbar-xft-git)
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=('killall: send signals to blocks')
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
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

# vim: ts=2 sw=2 et ft=sh:
