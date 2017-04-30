# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Nicolas Pouillard http://nicolaspouillard.fr

pkgname=spiped
pkgver=1.6.0
pkgrel=1
pkgdesc="Secure pipe daemon"
arch=('i686' 'x86_64')
source=(http://www.tarsnap.com/$pkgname/$pkgname-$pkgver.tgz)
url="http://www.tarsnap.com/spiped.html"
license=('BSD')
depends=('openssl')
sha256sums=('e6f7f8f912172c3ad55638af8346ae7c4ecaa92aed6d3fb60f2bda4359cba1e4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/man/man1
  MAN1DIR=${pkgdir}/usr/share/man/man1 BINDIR=${pkgdir}/usr/bin make install
  install -Dm644 COPYRIGHT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

