# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=diebahn
pkgver=2.0.0
pkgrel=1
pkgdesc="Travel with all your train information in one place"
url="https://gitlab.com/schmiddi-on-mobile/railway"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL3")
makedepends=("cargo" "meson")
depends=("libadwaita" "libsecret" "protobuf")
source=("https://gitlab.com/schmiddi-on-mobile/railway/-/archive/$pkgver/railway-$pkgver.tar.gz")
sha256sums=("4ca53f5f6f429d8327fb325b71964d1d224b334c79a3165492c6443c56b0601c")
options=(!lto)

build() {
	cd "${srcdir}"/railway-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/railway-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
