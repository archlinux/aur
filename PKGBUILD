# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=1.4.0
pkgrel=1
pkgdesc="GTK4 frontend for the travel information of the german railway"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("bd4d50d62de9db5e0540c67dc8fce95f682b0459d6a87976f90bcbe13ea36389")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
