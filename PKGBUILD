# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock-example-module
pkgver=1.3.7
pkgrel=3
pkgdesc="Example module for gtklock"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock-example-module"
license=('MIT')
depends=(gtk3 gtklock)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6571367bf1982d86c7d4f2f30fdc4dde393350e309461d6a7facab8ce287ffbc')
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
