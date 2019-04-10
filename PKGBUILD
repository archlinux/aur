pkgname=libfixbuf
pkgver=2.3.0
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, as defined in the \"Specification of the IPFIX Protocol for the Export of IP Flow Information\" (RFC 5101). "
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed63314f21a7a6bbf0d08da416403237a867c3f3496d061f10e148e6d8ecea63')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
