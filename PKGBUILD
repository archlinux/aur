#
# PKGBUILD: vlink
#
# Maintainer: AYANE69 <_ayane69_-at-_protonmail_-dot-_com_>
#

pkgname=vlink
pkgver=0.17a
_pkgver="0_17a"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('any')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz 
        http://sun.hasenbraten.de/vlink/release/vlink.pdf)
sha256sums=('f6754913d47bc97cf4771cc0aa7c51de368a04894be35b8dc5e4beac527f5b82'
            '09ea4f215ad8be47ec1686f1ebaa498c5a58092a05660fbcc8c5826dcdf395d1')

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
