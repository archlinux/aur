# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot
pkgver=1.1.6
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://github.com/maandree/asroot"
license=('custom:ISC')
source=(asroot-$pkgver.tar.gz::https://github.com/maandree/asroot/archive/${pkgver}.tar.gz)
sha256sums=(e7a402f424b57a12d937138eae20e7dc9e3cbb46ece551037ab65d45aad7c4fd)

build() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
