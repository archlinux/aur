# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=libdmx
pkgver=1.1.4
pkgrel=2
pkgdesc='X11 Distributed Multihead extension library'
arch=('x86_64' 'i686')
license=('custom')
url='https://xorg.freedesktop.org/'
depends=('libxext')
makedepends=('xorg-util-macros')
source=("https://www.x.org/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix='/usr' \
    --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
