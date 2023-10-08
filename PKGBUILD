# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=2.1.0
pkgrel=1
pkgdesc="Travel with all your train information in one place"
url="https://gitlab.com/schmiddi-on-mobile/railway"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/schmiddi-on-mobile/railway/-/archive/$pkgver/railway-$pkgver.tar.gz")
sha256sums=("65e4b761286a61e02054e8d0523c98a38e30b89205b2031134cfa76701197be8")
options=(!lto)

build() {
	cd "${srcdir}"/railway-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/railway-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
