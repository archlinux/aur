# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=odpi
pkgver=4.6.1
pkgrel=1
pkgdesc="Oracle Database Programming Interface for Drivers and Applications "
arch=(x86_64)
url="https://oracle.github.io/odpi/"
license=('UPL' 'Apache')
depends=('glibc')
source=("https://github.com/oracle/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('0e4afbedb80d288d5d658d08be041c50')
build() {
	cd "$pkgname-$pkgver"
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr/" install
}

