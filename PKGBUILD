# Maintainer: Cleiton Floss <cleitonfloss@gmail.com>

pkgname=envelope
pkgver=0.0.4
pkgrel=1
pkgdesc="Personal budget manager"
arch=('x86_64')
url="https://github.com/cjfloss/envelope"
license=('GPL3')
depends=(gtk3 vala granite libgee sqlite)
makedepends=(git meson ninja)
provides=($pkgname)
conflicts=($pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjfloss/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c72eb03cb65a8b1de52858a8fcbc46698abac84f8fef866312049cc86e218d4a')
options=(strip)

build() {
    cd "$pkgname-$pkgver"
    arch-meson . build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
