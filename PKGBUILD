# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=vmd-stride
pkgver=19950628
pkgrel=1
pkgdesc="Used by VMD to compute the secondary structure given the protein 3D coordinates"
url="http://www.ks.uiuc.edu/Research/vmd/doxygen/extprogs.html"
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc')
source=('http://www.ks.uiuc.edu/Research/vmd/extsrcs/Stride_src.tar.Z')
sha256sums=('c40f7de64947ebab7ec49511c0d264b08bc0fcbc703014bdc85d83a7389be230')

build() {
  cd "${srcdir}"
  make stride
}

package() {
  cd "${srcdir}"
  install -D -m 755 stride "${pkgdir}/usr/bin/stride"
  # Is all of the STRIDE code under this license, or only part of it?
  head -n 73 nsc.h > LICENSE
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
