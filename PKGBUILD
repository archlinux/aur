# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="lobstertwo"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.006
pkgrel=2
pkgdesc="Other lovely bold condensed script, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/${_font}/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=(
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Bold.ttf"
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-BoldItalic.ttf"
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Italic.ttf"
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/LobsterTwo-Regular.ttf"
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/FONTLOG.txt"
  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/OFL.txt"
  )
md5sums=(
  '5bc7d54b8f2cd0f13f3e58d6494d5093'
  '92f89b4b61c0c72a3f8bfdbc6eb55a5e'
  'e02c8a94e3ae798fd8b689f8419f4c7b'
  '3ba9370ba9b4e0d63cb765389d3c0e0b'
  '72c6cb64d60499ef3b5716cd2925705d'
  'f93bee03c3e8cacbef251056a31093c9'
  )

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
