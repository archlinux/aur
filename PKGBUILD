# Maintainer: Salama <salama@salama.xyz>
pkgname=energygraph
pkgver=1.1_1
pkgrel=1
pkgdesc="Graphs the power use of a host inside a text terminal, using intel-rapl data from the /sys filesystem. Uses RAPL interface in /sys to determine the energy use of different zones, and graphs it in a text terminal."
arch=('x86_64')
url="https://github.com/stolk/$pkgname"
license=('MIT')
makedepends=('git' 'make')
_tag=0ca5682a06f0460c445a534e4996512c86a16985
source=(git+https://github.com/stolk/$pkgname.git#tag=$_tag)
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"

	make DESTDIR="$pkgdir/" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
