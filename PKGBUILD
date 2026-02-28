# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=gasroot
pkgver=1.0.2
pkgrel=1
pkgdesc="A graphical, simple alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/gasroot"
license=('custom:ISC')
depends=(libenv gtk2)
makedepends=(libenv gtk2)
source=(gasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(f7ff56d4ac63636f73f48a687376f566b9c09b04bf1bf3c81223810f1001d13c)

build() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot
}

package() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot install
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot post-install
}
