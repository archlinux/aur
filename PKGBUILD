# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Jelle  van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=5.6.0
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPL')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('29939d77c21d699e69fde020d01d9cc9eeb5639cb67d45e28a4dfd2bb9c3e7aabf09dfce2993b542c149bb1ea2794f6eafbe472fd1b92d418002c9fe62cce890')

package(){
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/cura"
  
  # see https://github.com/Ultimaker/cura-binary-data/issues/6
  rm -rf "${pkgdir}/usr/share/cura/resources/i18n" 
}
