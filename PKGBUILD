# Maintainer: Farzin Monsef < farzin at inphraz dot ir >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=odpi
pkgver=5.4.1
pkgrel=1
pkgdesc="Oracle Database Programming Interface for Drivers and Applications "
arch=(x86_64)
url="https://oracle.github.io/odpi/"
license=('UPL-1.0' 'Apache-2.0')
depends=('glibc')
source=("https://github.com/oracle/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc02c694e119c69af3a556a363fe406b26996d0e71c4c5dfbf9d7a253efa6a01')

build() {
	cd "$pkgname-$pkgver"
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="$pkgdir/usr/" install
}

