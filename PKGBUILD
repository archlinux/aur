# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot
pkgver=1.0
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://github.com/maandree/asroot"
license=('custom:ISC')
source=(asroot-$pkgver.tar.gz::https://github.com/maandree/asroot/archive/${pkgver}.tar.gz)
sha256sums=(09efac1aa8e2634723979725541cc9919dfcc95dc8730c8254370520f8d54360)

build() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
