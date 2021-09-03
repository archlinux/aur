# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: alucryd <alucryd at gmail dot com>

pkgname=xf86miscproto
pkgver=0.9.3
pkgrel=1
pkgdesc="X11 Misc extension wire protocol"
arch=('any')
url="http://xorg.freedesktop.org/"
license=('custom')
makedepends=('xorg-util-macros')
source=("https://gitlab.freedesktop.org/xorg/proto/xf86miscproto/-/archive/xf86miscproto-0.9.3/xf86miscproto-xf86miscproto-0.9.3.tar.bz2")
sha256sums=('29ae3143f5bb0cf9ee9ac873ac259a7400a98061fa279a262bb8fe78ea8f5afe')

build() {
  cd ${pkgname}-${pkgname}-${pkgver}

  ./autogen.sh --prefix='/usr'
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 {,"${pkgdir}"/usr/share/licenses/${pkgname}/}COPYING
}
