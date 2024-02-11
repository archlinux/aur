# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.12.0
pkgrel=1
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
	"libspelling-git: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("3c0bf3bf152367734e316e5a29ad99447eedd0b443a10e3b0fc3c921603980c4")
options=(!lto)

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
