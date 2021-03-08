# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=libfixbuf
pkgver=2.4.1
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, (RFC 5101)."
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8c535d48120b08df1731de709f2dbd2ba8bce568ad64cac34826102caf594d84')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
