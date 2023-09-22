# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.10.0
pkgrel=1
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
	"libspelling-git: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("c34d1531bdf4a30c0a68a05f66465f26b726a392cc08b9b3267b60f73319b23e")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
