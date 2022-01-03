# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Nicolas Pouillard http://nicolaspouillard.fr

pkgname=spiped
pkgver=1.6.2
pkgrel=1
pkgdesc="Secure pipe daemon"
arch=('i686' 'x86_64')
source=(http://www.tarsnap.com/$pkgname/$pkgname-$pkgver.tgz)
url="http://www.tarsnap.com/spiped.html"
license=('BSD')
depends=('openssl')
sha256sums=('05d4687d12d11d7f9888d43f3d80c541b7721c987038d085f71c91bb06204567')

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

