# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-example-module
pkgver=1.3.6
pkgrel=3
pkgdesc="Example module for gtklock"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-example-module"
license=('MIT')
depends=(gtk3 gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83777fd029d38c9c5b6b9050d8090695b8cb05b5e30253e17fc890ebb7158191')
LDFLAGS="${LDFLAGS/--as-needed/--no-as-needed}"

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir"/usr/share/licenses/"$pkgname"
	install -m644 LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENCE
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
