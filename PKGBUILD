# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=1.4.1
pkgrel=1
pkgdesc="GTK4 frontend for the travel information of the german railway"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("340819a30cbedaccc29cfa5ab5758cc6c4f7cdc025f1b61038d529a510267a17")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
