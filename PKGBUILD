# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=odpi
pkgver=4.4.1
pkgrel=1
pkgdesc="Oracle Database Programming Interface for Drivers and Applications "
arch=(x86_64)
url="https://oracle.github.io/odpi/"
license=('UPL' 'Apache')
depends=('glibc')
source=("https://github.com/oracle/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('d47b9436d05daa6cc879f763b22a27a1')
build() {
	cd "$pkgname-$pkgver"
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr/" install
}

