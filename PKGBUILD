#
# PKGBUILD: vlink
#
# Maintainer: AYANE69 <_ayane69_-at-_protonmail_-dot-_com_>
#

pkgname=vlink
pkgver=0.18a
_pkgver="0_18a"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('any')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz 
        http://sun.hasenbraten.de/vlink/release/vlink.pdf)
sha256sums=('8d151cdd30a4feb575a364e68810c2bc300fe1a7c074dbbee6fd1175a6c5bfae'
            '816c80ee3f8d0f9bab892869baa34017ce8f49962cfc2a3d5475d8adb9f8daa7')

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
