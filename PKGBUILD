# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdmx
pkgver=1.1.5
pkgrel=1
pkgdesc='X11 Distributed Multihead extension library'
arch=('x86_64' 'i686')
license=('custom')
url='https://xorg.freedesktop.org/'
depends=('libxext')
makedepends=('xorg-util-macros')
source=("https://www.x.org/releases/individual/lib/${pkgname}-${pkgver}.tar.gz")
sha256sums=('070e82cc1daa1b21ee1339aef56a909eab04cbe7d430fabfbb01ecd21b2dd9f3')

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
