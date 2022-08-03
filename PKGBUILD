# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-example-module
pkgver=1.3.4
pkgrel=1
pkgdesc="Example module for gtklock"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-example-module"
license=('MIT')
depends=(gtk3 gtklock=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1721649441a7ed15eb3b9d22b793392c644d0ddd50002c51c8e76739dfe45b5e')
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
