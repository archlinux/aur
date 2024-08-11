# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=railway
pkgver=2.7.0
pkgrel=1
pkgdesc="Travel with all your train information in one place"
url="https://gitlab.com/schmiddi-on-mobile/railway"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
conflicts=("diebahn")
replaces=("diebahn")
source=("https://gitlab.com/schmiddi-on-mobile/railway/-/archive/$pkgver/railway-$pkgver.tar.gz")
sha256sums=("4028f5c8ab88a49e2952d259c2edd5ce8e087df161bd94846ae430924534d4e6")
options=(!lto)

build() {
	cd "${srcdir}"/railway-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/railway-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
