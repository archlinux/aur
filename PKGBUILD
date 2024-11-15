# Maintainer: Koro <koro@kzxiv.net>
# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font='cantora'
_group='impallari'
pkgname=ttf-${_group}-${_font}
pkgver=1.002
pkgrel=2
pkgdesc="Cantora ('Singer' in Spanish) is a friendly semi-formal, semi-condensed, semi-sans-serif font, from Pablo Impallari"
arch=(any)
url='https://fonts.google.com/specimen/Cantora+One'
license=('OFL')
groups=("${_group}-fonts")
# The official Google source above obfuscates the download link, but it can be found using Developer Tools or by doing:
#  curl -s -H 'Accept: application/json' 'https://fonts.google.com/download/list?family=Cantora+One' | tail -n +2 | jq -r '.manifest.fileRefs[0].url'
# The link seems to stay stable over time and from different source IPs.
# It also lacks the licence, which is bundled into this package instead.
source=("CantoraOne-Regular.ttf::https://fonts.gstatic.com/s/cantoraone/v19/gyB4hws1JdgnKy56GB_JX6zdZ4vZVbgZ.ttf"
        'OFL.txt')
sha256sums=('a236619be1a6025c7dfde232821f0ef8658ae35e7becde543c34cade9c6dca61'
            '22ef36d651a87c85f2f8f04007d9e9a9bba75106151f39163844ef61ea023843')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
