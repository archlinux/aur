# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.9.0
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("eda736c6453c9ed4960d485e727f903ef57161555edd959ae6f030b74603accc")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
