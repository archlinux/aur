# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=asroot
pkgver=1.1.9
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/asroot"
license=('custom:ISC')
depends=(libenv)
makedepends=(libenv)
source=(asroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(29e7c4e1081846b0b859944daa9e407366e9b82d99a77099d17086740756220e)

build() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
