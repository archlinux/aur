# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Jelle  van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=5.7.0
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPL')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('913df9cd85eda924f6e0d74d56c63011d0a7fa554f737fca0118c19fcc9fdc63362bf514bf8e4ad00524fa54e5e81ef04254111c4045dc3513a5537c60fd5ca7')

package(){
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/cura"
  
  # see https://github.com/Ultimaker/cura-binary-data/issues/6
  rm -rf "${pkgdir}/usr/share/cura/resources/i18n" 
}
