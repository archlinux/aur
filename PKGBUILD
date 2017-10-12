# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=adjbacklight
pkgver=8.0
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('custom:ISC')
depends=('linux')
source=(https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(4df27ee6e01f9c0dae6ac0100b6f49e88aca13e4f3cee6c15944a96fed061840)


build() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
