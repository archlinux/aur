# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font='cantora'
_group='impallari'
pkgname=ttf-${_group}-${_font}
pkgver=1.002
pkgrel=1
pkgdesc="Cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, semi–sans-serif font, from Pablo Impallari"
arch=(any)
url='https://fonts.google.com/specimen/Cantora+One'
license=('OFL')
groups=("${_group}-fonts")
# source=("Cantora_One.zip::https://fonts.google.com/download?family=Cantora%20One")
# The official Google source above now obfuscates the download link, which changes on each download.
# These sites have the older 1.001 version:
#   https://www.fonts4free.net/cantora-one-font.html
#   https://fontmeme.com/fonts/cantora-one-font/
#   https://www.1001freefonts.com/cantora-one.font
#   https://www.urbanfonts.com/fonts/Cantora_One.font
#   https://www.fontmirror.com/cantora-one
# The following has the newer 1.002 version, as per Google, although the size is slightly different. It also lacks the licence, so I'll just bundle the Google version into this package itself.
source=("Cantora_One.${pkgver-pkgrel}.zip::https://font.download/dl/font/cantora-one.zip"
        'OFL.txt')
sha256sums=('0a6bf27e748154fc94ea86c267881b1795e71964928a203d30987102260970a7'
            '22ef36d651a87c85f2f8f04007d9e9a9bba75106151f39163844ef61ea023843')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
