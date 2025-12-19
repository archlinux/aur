# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=gasroot
pkgver=1.0
pkgrel=1
pkgdesc="A graphical, simple alternative to sudo and doas"
arch=('x86_64')
url="https://codeberg.org/maandree/gasroot"
license=('custom:ISC')
depends=(libenv gtk2)
makedepends=(libenv gtk2)
source=(gasroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(043d3ccb69ba3d6027e2bda314928d62a7611903378381e95be228c527077760)

build() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot
}

package() {
  cd "${srcdir}/gasroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot install
  make DESTDIR="${pkgdir}/" PREFIX=/usr LIBEXECDIR=/lib/gasroot post-install
}
