# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=libfixbuf
pkgver=3.0.0.alpha2
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, (RFC 5101)."
arch=('i686' 'x86_64')
url="https://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("https://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0ff11bf5fcb48a2e6ea791e800de3cd29e868bb298a734e87335d37f38e1c263')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
