# Maintainer: Farzin Monsef < farzin at inphraz dot ir >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=odpi
pkgver=5.5.0
pkgrel=1
pkgdesc="Oracle Database Programming Interface for Drivers and Applications "
arch=(x86_64)
url="https://oracle.github.io/odpi/"
license=('UPL-1.0' 'Apache-2.0')
depends=('glibc')
source=("https://github.com/oracle/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14087dad15622891daa94ec637d9cb0c254d27c0d92c69fab4aff5a8f28e8293')

build() {
	cd "$pkgname-$pkgver"
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="$pkgdir/usr/" install
}

