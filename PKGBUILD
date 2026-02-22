# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=adjbacklight
pkgver=8.2.3
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://codeberg.org/maandree/adjbacklight"
license=('custom:ISC')
source=(adjbacklight-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(f4dd88f8eb92305c15fec9c98279ff093e62bb947fbbff5bc0b5de0d2f706053)

build() {
  cd "${srcdir}/adjbacklight"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

check() {
  cd "${srcdir}/adjbacklight"
  make check
}

package() {
  cd "${srcdir}/adjbacklight"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
