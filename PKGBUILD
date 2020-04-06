# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Nicolas Pouillard http://nicolaspouillard.fr

pkgname=spiped
pkgver=1.6.1
pkgrel=1
pkgdesc="Secure pipe daemon"
arch=('i686' 'x86_64')
source=(http://www.tarsnap.com/$pkgname/$pkgname-$pkgver.tgz)
url="http://www.tarsnap.com/spiped.html"
license=('BSD')
depends=('openssl')
sha256sums=('8d7089979db79a531a0ecc507b113ac6f2cf5f19305571eff1d3413e0ab33713')

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

