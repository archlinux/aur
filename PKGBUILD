# Maintainer: Bert Muennich <ber.t at posteo.de>

pkgname=physlock
pkgver=11
pkgrel=1
pkgdesc="lightweight linux console locking tool"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/muennich/physlock"
depends=(pam)
source=(https://github.com/muennich/physlock/archive/v${pkgver}.tar.gz)
sha256sums=('f03031a6f4c6a08d62098457834d04b8835082a76609059451397356a83d4442')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

