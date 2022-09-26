# Maintainer: Salama <salama@salama.xyz>
pkgname=energygraph
pkgver=1.0_1
pkgrel=1
pkgdesc="Graphs the energy use of a host inside a text terminal, using intel-rapl data from the /sys filesystem. Uses RAPL interface in /sys to determine the energy use of different zones, and graphs it in a text terminal."
arch=('x86_64')
url="https://github.com/stolk/$pkgname"
license=('MIT')
makedepends=('git' 'make')
_tag=395e38c63410f8edf6882826206d9d7247c92c5c
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
