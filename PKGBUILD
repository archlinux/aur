# Maintainer: Bert Muennich <ber.t at posteo.de>

pkgname=id3ted
pkgver=1.0
pkgrel=1
pkgdesc="command line id3 tag editor"
arch=(i686 x86_64)
license=('GPL')
url="http://muennich.github.com/id3ted/"
depends=('file' 'taglib')
source=(http://muennich.github.com/id3ted/release/$pkgname-$pkgver.tar.gz)
sha1sums=('53055883b15319cad495f8ec353883d926d647d4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
