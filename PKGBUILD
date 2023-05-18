# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=powersupply
pkgver=0.8.0
pkgrel=1
pkgdesc="GTK3 app to display power status of phones"
url="https://gitlab.com/MartijnBraam/$pkgname"
arch=("any")
license=("AGPL3")
depends=("libhandy")
makedepends=("meson")
source=("https://gitlab.com/MartijnBraam/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("2bcd5c7a33a041edf29de2c7270f089c8551ca8025fe8afc45f5bb822abe8172")

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
