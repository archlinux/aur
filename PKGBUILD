# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=libsrs2
pkgver=1.0.18
pkgrel=2
pkgdesc='The next generation SRS library'
arch=('i686' 'x86_64')
url='https://www.libsrs2.org/'
license=('GPL2' 'BSD')
depends=('glibc')
provides=('libsrs2.so')
source=("$pkgname-$pkgver.tar.gz::$url/srs/$pkgname-$pkgver.tar.gz")
sha256sums=('9d1191b705d7587a5886736899001d04168392bbb6ed6345a057ade50943a492')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE.GPL-2 LICENSE.BSD -t "$pkgdir/usr/share/licenses/$pkgname"
}
