# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=gasroot
pkgver=1.0.1
pkgrel=1
pkgdesc="A graphical, simple alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/gasroot"
license=('custom:ISC')
depends=(libenv gtk2)
makedepends=(libenv gtk2)
source=(gasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(8955dcd741b523df8784eb9c4b10bb755f5bbdc3a9c0094a12da7842fa4666e6)

build() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot
}

package() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot install
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot post-install
}
