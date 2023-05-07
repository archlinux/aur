# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.8.0
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/Schmiddiii/$pkgname"
arch=("any")
license=("AGPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/Schmiddiii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("1a51d92bc0248c20cf4519c91b9d79a412eb740fb8fbc33a1768050381efbeb9")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
