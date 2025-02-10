# Maintainer: LS-Shandong <ls-shandong at outlook dot com>
# Contributor: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-redis
pkgver=2.2.0
pkgrel=2
pkgdesc='Guile module for the Redis key-value data store'
arch=(any)
license=(GPL3)
depends=('guile>=2.0.9')
url=http://savannah.nongnu.org/projects/guile-redis
source=( https://download-mirror.savannah.nongnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig} )
sha256sums=('3dcdc585e72d490c9ec91106ecab6a3b850ea0a672d9d8d99b584d945bf59370'
            'ad18421241542e098c47bcdfacca3f968b6a0a23e4f206c76459944d20aa951c')
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
