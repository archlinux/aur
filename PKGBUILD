# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour
pkgver=10
pkgrel=1
pkgdesc="Window Manager agnostic swallowing feature for terminal emulator"
arch=('x86_64')
url="https://github.com/salman-abedin/devour"
license=('GPL3')
depends=('libx11')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/salman-abedin/devour/archive/v$pkgver.tar.gz")
sha256sums=('43cfb11120b2692bd2423eae577b5c2255eca53b2a8dbc73b5352b4d542d92aa')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
} 

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
