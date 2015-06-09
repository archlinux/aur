# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="miltonian"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.005
pkgrel=1
pkgdesc="Two playful fonts for all your informal needs, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/${_font}/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
makedepends=('wget')
source=()

package() {
  cd ${srcdir}
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/miltonian/FONTLOG.txt || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/miltonian/Miltonian-Regular.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/miltoniantattoo/MiltonianTattoo-Regular.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/miltonian/OFL.txt || return 1

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
