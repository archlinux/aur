# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-redis
pkgver=2.1.2
pkgrel=2
pkgdesc='Guile module for the Redis key-value data store'
arch=(any)
license=(GPL3)
depends=('guile>=2.0.9')
url=http://savannah.nongnu.org/projects/guile-redis
source=( https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig} )
md5sums=('c56f2b2b2ccd948ee6a65d1c2908103e' 'SKIP')
validpgpkeys=( 7CEC5511C8D057A9EF17470C54D4CC6FFC7468F4 )
options=(!strip)

build(){
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir install
}
