# Maintainer: Bert Muennich <ber.t at posteo.de>

pkgname=physlock
pkgver=0.5
pkgrel=1
pkgdesc="lightweight linux console locking tool"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/muennich/physlock"
depends=()
source=(https://github.com/muennich/physlock/archive/v${pkgver}.tar.gz)
sha256sums=('395873abe9bfb3879df796bd9d857be024c4ca01c5b6e83cfd3253647b558782')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

