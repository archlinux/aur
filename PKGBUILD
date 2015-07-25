# Maintainer: James Morris - jwm-art - james@jwm-art.net
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgname=bebas_neue
pkgver=20150506
pkgrel=1
#depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Bebas Neue is a sans serif font family based on the original Bebas Neue free font by Ryoichi Tsunekawa."
arch=('any')
url="http://fontfabric.com/bebas-neue/"
license=('custom:FONTFABRIC(tm) FREE FONT END USER LICENSE AGREEMENT v1.0 2009')
source=(bebas-${pkgver}.zip::http://fontfabric.com/downfont/bebas.zip)
install=$pkgname.install
md5sums=('efecbc6a12926cce38b7c380edbb15c5')

package() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
  install -m644 'FFF_EULA_license.pdf' "${pkgdir}/usr/share/licenses/${pkgname}/eula.pdf" || return 1
}
