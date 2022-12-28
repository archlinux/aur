# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=libfixbuf
pkgver=3.0.0.alpha1
pkgrel=1
pkgdesc="A compliant implementation of the IPFIX Protocol, (RFC 5101)."
arch=('i686' 'x86_64')
url="http://tools.netsa.cert.org/fixbuf/index.html"
license=("LGPL")
groups=("netsa")
depends=("glib2>=2.6.4")
source=("http://tools.netsa.cert.org/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('49dfc9de3fc47f62b746b08baadd3acc5c3883f3ee4e4802e159207b77fff302')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
