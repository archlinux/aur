# Maintainer: Bert Muennich <ber.t at posteo.de>

pkgname=physlock
pkgver=0.4.5
pkgrel=1
pkgdesc="lightweight linux console locking tool"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/muennich/physlock"
depends=()
source=(https://github.com/muennich/physlock/archive/v${pkgver}.tar.gz)
md5sums=('5b39391638375c680599779aeee65569')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

