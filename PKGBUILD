# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=asroot
pkgver=1.1.12
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/asroot"
license=('custom:ISC')
depends=(libenv)
makedepends=(libenv)
source=(asroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(af8f4f5b82f1dfa6461950b9e47e4bafc5bc9b3e0a9f2f3cc7c8801c4d8ab827)

build() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
