# Maintainer: Jelle  van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=4.13.1
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPL')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('c15da3704d8e732c723e20462cf46a00785de9fa')

package(){
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/cura"
  
  # see https://github.com/Ultimaker/cura-binary-data/issues/6
  rm -rf "${pkgdir}/usr/share/cura/resources/i18n" 
}
