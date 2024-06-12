# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=railway
pkgver=2.6.0
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
sha256sums=("bb2cb3d388f18ad1e53c755733c3b11990e4df6ea7e60fbf1d8a3da0106129ae")
options=(!lto)

build() {
	cd "${srcdir}"/railway-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/railway-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
