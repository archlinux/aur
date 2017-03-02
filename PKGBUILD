# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-vollkorn
pkgdesc="Vollkorn typeface by Friedrich Althausen (OpenType)"
url='http://vollkorn-typeface.com/'
license=('custom:SIL Open Font License')
pkgver=4.012
pkgrel=1
changelog=ChangeLog.${pkgname}
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install

source=(http://vollkorn-typeface.com/download/vollkorn-${pkgver//./-}.zip)
sha512sums=('e25a3932e37a5706b5b849bacc36fa2be972fcd35e5f9d4274c19c07c75629d4ebdc30497e85157a3cdb2a357437b8f310c6ce583a754cdb5da40db5d2935940')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/PS-OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -D -m644 "${srcdir}/Fontlog.txt" "${pkgdir}/usr/share/doc/${pkgname}/Fontlog.txt"
}
