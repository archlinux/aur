# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=1.3.0
pkgrel=1
pkgdesc="GTK4 frontend for the travel information of the german railway"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("AGPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("97739b7c7458471e8ac61d9b534b617e47243df9102dc7064e61a8cf6a21e6a7")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
