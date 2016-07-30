# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eigen
pkgver=3.2.0
_basever=3.2.0-r0.10
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra (${_target})"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
source=("http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/libeigen-dev_${_basever}_cortexa9-vfpv3.ipk")
sha1sums=('732807de0cddada32a8262f8b91bcaf49b564ae2')

package() {
  cd "${srcdir}"
  for file in *.ipk; do
    ar x $file
    tar xf data.tar.gz
  done

  mkdir -p ${pkgdir}/usr/${_target}
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r usr ${pkgdir}/usr/${_target}
}
