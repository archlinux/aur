# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
pkgname=arpackpp
pkgver=2.3.0
pkgrel=2
pkgdesc="Arpack++ with patches (C++ interface to ARPACK)"
arch=('x86_64')
url="http://reuter.mit.edu/software/arpackpatch"
license=('custom:BSD-3-clause')
depends=(arpack)
optdepends=(superlu suitesparse)
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/m-reuter/${pkgname}/tar.gz/refs/tags/${pkgver}")
sha256sums=('288fb4cd2dd08e02ed29db579bc1278023a06415dd2f63b1fdc323c7993fcb1a')
b2sums=('b20f49082150f130746fe41e324ad3be06617cb858161d0cca8ce2c04c52b8a2311f0da875b8d654e3070835ae5c4df3fc819e930009517355ef2d07b55c4bc7')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # install headers
  install -d ${pkgdir}/usr/include/arpack++
  install include/*.h ${pkgdir}/usr/include/arpack++

  # install docs
  install -d ${pkgdir}/usr/share/doc/arpack++
  install doc/* ${pkgdir}/usr/share/doc/arpack++

  # install tutorials
  install -d ${pkgdir}/usr/share/arpack++/examples
  cp -r examples/* ${pkgdir}/usr/share/arpack++/examples

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/arpack++/LICENSE"
}
