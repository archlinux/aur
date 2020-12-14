# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=libfixbuf
pkgver=2.4.0
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, (RFC 5101)."
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bf20f9f7986a525ea6cc648d32f4ba30bfeb2a83f8c830bc39c48dfa7a415175')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
