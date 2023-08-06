# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.9.1
pkgrel=1
pkgdesc="An unofficial Signal GTK client"
url="https://gitlab.com/schmiddi-on-mobileii/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/schmiddi-on-mobileii/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("e365f0db106b1d27247c03aaa40e508c6fe2240937b11ff4ec2e9866d78ecaee")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
