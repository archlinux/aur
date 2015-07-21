pkgname=redstore
pkgver=0.5.4
pkgrel=1
pkgdesc="RedStore is a lightweight RDF triplestore written in C using the Redland library."
arch=('i686' 'x86_64')
url="http://www.aelius.com/njh/redstore/"
depends=('rasqal>=0.9.27' 'redland>=1.0.14' 'raptor>=2.0.4')
license=('GPLv3')
options=('!libtool')
source=(http://www.aelius.com/njh/redstore/$pkgname-$pkgver.tar.gz)
md5sums=('5857c99d0aaf384050ea17e15354feba')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make prefix=${pkgdir}/usr install
}

