# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=libdmx
pkgver=1.1.5
pkgrel=3
pkgdesc='Xlib-based library for the DMX (Distributed Multihead X) extension'
arch=('x86_64' 'i686')
license=('MIT')
url='https://gitlab.freedesktop.org/xorg/lib/libdmx'
depends=(libx11 glibc xorgproto libxext)
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
