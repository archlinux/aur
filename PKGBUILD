# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-vollkorn
pkgdesc="Vollkorn typeface by Friedrich Althausen (OpenType)"
url=('http://vollkorn-typeface.com/')
license=('custom:SIL Open Font License')
pkgver=3.005
pkgrel=1
changelog=ChangeLog.${pkgname}
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install

source=(http://vollkorn-typeface.com/download/vollkorn-${pkgver//./-}.zip)
md5sums=('3ec0bfdae17dc8dd088d6be4001169bf')
sha512sums=('38e9171016c0902a972bd53bdca65808807e057e1025b96cd8dbec2e0ff1169276a52ebe6ad3b155892fc5b6af248acd20ee54c7f33c2e34d7da87d3858450c0')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/PS-OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/OpenFontLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OpenFontLicense.txt"
  install -D -m644 "${srcdir}/Fontlog.txt" "${pkgdir}/usr/share/doc/${pkgname}/Fontlog.txt"
}
