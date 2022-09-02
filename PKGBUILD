# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-example-module
pkgver=1.3.5
pkgrel=1
pkgdesc="Example module for gtklock"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-example-module"
license=('MIT')
depends=(gtk3 gtklock=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b3f2615270f03fb14ed2ea2151cf7c731ee6e13bad3a57746b3d6a3504444ea')
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
