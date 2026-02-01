# Maintainer: Dmitrii Balabin <vinyl6428 at gmail dot com>
pkgname=openscad-attachable-text3d
_name=openscad_attachable_text3d
pkgver=1.0.2
pkgrel=1
pkgdesc="OpenSCAD module for creating blocks of 3D text that are attachable with BOSL2"
arch=('any')
url='github.com/jon-gilbert/openscad_attachable_text3d'
license=('MIT')
source=("${_name}-${pkgver}.tar.gz::https://${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('a798100e7f6204d1a7ffda688b1d752ed6e34cb76fd9d64fa693a2091c93eb18d0389a663f60c9104c11552a7c2c0f9902debe4ff94e6acdcd14e25fbd926fb0')

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  mkdir -p "${pkgdir}/usr/share/openscad/libraries/"
  
  cp -r "${srcdir}/${_name}-${pkgver}" "${pkgdir}/usr/share/openscad/libraries/${_name}"
}
