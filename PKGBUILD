pkgname="libfixbuf"
pkgver=1.7.1
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, as defined in the \"Specification of the IPFIX Protocol for the Export of IP Flow Information\" (RFC 5101). "
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('46d5d0362581a09902b24635b4679b6a')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
