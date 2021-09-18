# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot
pkgver=1.1.5
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://github.com/maandree/asroot"
license=('custom:ISC')
source=(asroot-$pkgver.tar.gz::https://github.com/maandree/asroot/archive/${pkgver}.tar.gz)
sha256sums=(95585007d4cad2577c96a0c5d14d2f36aa796a3a4d918f292c3192e5ae601e09)

build() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
