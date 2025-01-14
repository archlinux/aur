#
# PKGBUILD: vlink
#
# Maintainer: AYANE69 <_ayane69_-at-_protonmail_-dot-_com_>
#

pkgname=vlink
pkgver=0.18
_pkgver="0_18"
pkgrel=1
pkgdesc="A portable linker for multiple file formats including AmigaOS hunk format. A companion to the vasm assembler."
arch=('any')
url="http://sun.hasenbraten.de/vlink/"
license=('custom')
depends=()
#source=(http://sun.hasenbraten.de/vlink/release/vlink.tar.gz) # latest unversioned source url
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz 
        http://sun.hasenbraten.de/vlink/release/vlink.pdf)
sha256sums=('a40c3313ef5b0956cad8f140557b70ee88a9e96cf14bbc3276cca565fa0fdf01'
            'e1017b057bd14aba7a4f7062cee56971dbe8a2bb4001a58dd358a11889f31a97')

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
