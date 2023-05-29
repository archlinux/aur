# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.8.2
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("AGPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("460d052a009d11df8cb6dfa326881fff679002024da5c2bd9259d640d5683a34")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
