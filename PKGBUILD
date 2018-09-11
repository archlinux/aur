pkgname=libfixbuf
pkgver=2.1.0
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, as defined in the \"Specification of the IPFIX Protocol for the Export of IP Flow Information\" (RFC 5101). "
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d3a0ddf3f693e9421efaa8029c8ff1f78c81c39e77661dc40a05b3515d086fe7')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
