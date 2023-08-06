# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=powersupply
pkgver=0.9.0
pkgrel=1
pkgdesc="GTK3 app to display power status of phones"
url="https://gitlab.com/MartijnBraam/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("MIT")
depends=("libhandy")
makedepends=("meson")
source=("https://gitlab.com/MartijnBraam/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("c5e4b71ced2df92fe5ab01826315aafc310e3abeedd3411a3fdba62a33712b0e")

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
