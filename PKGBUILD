# Maintainer: TimTechDev <archlinux [at] timtechdev [dot] de>
# Contributor: Jelle  van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura-binary-data
pkgver=5.3.0
pkgrel=1
pkgdesc="Binary data (firmwares and such) for cura"
url="https://github.com/Ultimaker/${pkgname}"
license=('AGPL')
arch=('any')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('76082a0410410c04071cbec4b8a10b34b73ffe84ecd23b2e2ef9bcc2db7ae43ca8f8f849dfed0338f1379d3ff80dd2d92b3bc7af31511c91ceed6f6a636daa5f')

package(){
  install -d "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/cura/" "${pkgdir}/usr/share/cura"
  
  # see https://github.com/Ultimaker/cura-binary-data/issues/6
  rm -rf "${pkgdir}/usr/share/cura/resources/i18n" 
}
