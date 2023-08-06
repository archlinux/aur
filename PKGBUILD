# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=1.5.0
pkgrel=1
pkgdesc="GTK4 frontend for the travel information of the german railway"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("57743ee71ec334a72a270ef4ab88b18ac3e386fa331659fb2cc59f4b9654c540")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
