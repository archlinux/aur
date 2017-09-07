# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-vollkorn
pkgdesc="Vollkorn typeface by Friedrich Althausen (OpenType)"
url='http://vollkorn-typeface.com/'
license=('custom:SIL Open Font License')
pkgver=4.015
pkgrel=1
changelog=ChangeLog.${pkgname}
depends=('fontconfig' 'xorg-font-utils')
arch=('any')

source=(http://vollkorn-typeface.com/download/vollkorn-${pkgver//./-}.zip)
sha512sums=('0f17cd06e670a34ae8e6a891c24494624bac2208b9bdf4add7d80229c22c4dce4ea5af835f2f9d1ae7133272563e372913926f72ea6d399effc605c2b00ef21e')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/PS-OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -D -m644 "${srcdir}/Fontlog.txt" "${pkgdir}/usr/share/doc/${pkgname}/Fontlog.txt"
}
