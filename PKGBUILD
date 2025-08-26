pkgname=powersupply
pkgver=0.10.1
pkgrel=0
pkgdesc="Graphical power_supply status tool for Linux mobile platforms"
url="https://gitlab.postmarketos.org/postmarketOS/powersupply"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("MIT")
depends=("gtk4" "libadwaita")
makedepends=("meson")
source=("https://gitlab.postmarketos.org/postmarketOS/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('77bfc4445d244e398e4644bc6f37f045315d2fea258c0cf5fca7400e14f03eca')

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	arch-meson . _build
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	DESTDIR="${pkgdir}" ninja -C _build install
}
