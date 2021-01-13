#
# PKGBUILD: vlink
#
# Maintainer: DYSEQTA <_dyseqta_-at-_me_-dot-_com_>
#

pkgname=vlink
pkgver=0.16g
_pkgver="0_16g"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('any')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz 
        http://sun.hasenbraten.de/vlink/release/vlink.pdf)
sha256sums=('4792740bda3850e82d22bd87d54a918c81571eff0fc447c52b94b2af38e90ba4' 
            '91df581c7d7c30cb65d2ff73056f423db3b59102c3175bc6a6c799c379c2aa26')

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
