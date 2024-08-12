# Maintainer: José Ferreira <jose.filipe.matos.ferreira@gmail.com>
pkgname=thonkbar-git
pkgver=r48.517eb9b
pkgrel=1
pkgdesc="minimalist block based lemonbar wrapper"
arch=('any')
url="https://github.com/JoseFilipeFerreira/${pkgname%-git}"
license=('GPL3')
makedepends=(git)
depends=(lemonbar-xft-git iniparser)
provides=("$pkgname")
conflicts=("$pkgname")
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
