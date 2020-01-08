# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

pkgname=libxxf86misc
pkgver=1.0.4
pkgrel=2
pkgdesc='X11 XFree86 misc extension library'
arch=('x86_64' 'i686')
license=('custom')
url='https://xorg.freedesktop.org/'
depends=('libxext' 'xorgproto')
makedepends=('git' 'xorg-util-macros')
source=("git+https://anongit.freedesktop.org/git/xorg/lib/libXxf86misc.git#tag=libXxf86misc-${pkgver}")
sha256sums=('SKIP')

build() {
  cd libXxf86misc

  ./autogen.sh \
    --prefix='/usr' \
    --disable-static
  make
}

package() {
  cd libXxf86misc

  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/libxxf86misc/
}

# vim: ts=2 sw=2 et:
