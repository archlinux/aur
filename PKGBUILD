#
# PKGBUILD: vlink
#
# Maintainer: DYSEQTA <_dyseqta_-at-_me_-dot-_com_>
#

pkgname=vlink
pkgver=0.16h
_pkgver="0_16h"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('any')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz 
        http://sun.hasenbraten.de/vlink/release/vlink.pdf)
sha256sums=('8e6113bdf3394343cbcb9280bff52aabb047ae751d1aed87860aecff6c10cd59' 
            'bd4342d1e288e098f4584d2f4702f106dcba62d2fff45bec872880bb7ec0f58a')

prepare()
{
  cd ${srcdir}/${pkgname}
}

build()
{
  cd ${srcdir}/${pkgname}
  make
}

package()
{
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp vlink.pdf ${pkgdir}/usr/share/doc/${pkgname}
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  cp vlink ${pkgdir}/usr/bin
}
