# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="lobstertwo"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.006
pkgrel=1
pkgdesc="Other lovely bold condensed script, from Pablo Impallari"
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
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/FONTLOG.txt || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Bold.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-BoldItalic.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Italic.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Regular.ttf || return 1
  wget -c https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/OFL.txt || return 1

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
