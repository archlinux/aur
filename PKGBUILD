# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=asroot
pkgver=1.1.8
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/asroot"
license=('custom:ISC')
source=(asroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(d67b91eabbe4bf72a6acf17cc1dbafb0d2cf44ddbf07eedf8bd1be53cc0d981f)

build() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
