# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.8.1
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("AGPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("a6deb31d5759860c0a3e072313d90e71350c7abc8cafbb73c59af28ccf261f18")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
