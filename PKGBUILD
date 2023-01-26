# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libcstl
pkgver=2.3.0
pkgrel=2
pkgdesc="A common data structure and used algorithms C library"
arch=('x86_64')
url="https://github.com/activesys/libcstl"
license=('LGPL2.1')
depends=('glibc')
provides=("$pkgname.so")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b67654554b6293989201703062c54202b8c73ca5455135c7f22762076c6b89c')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
