# Maintainer: Stick <stick@stma.is>
pkgname=otf-zakon
pkgver=1.000
pkgrel=1
pkgdesc='Zakon Text, the national typeface of Ukraine for official documents (Cyrillic and Latin)'
arch=('any')
url='https://mincult.gov.ua/zakon/'
license=('LicenseRef-Zakon')
# Upstream only publishes the files individually on Google Drive (no archive).
_dl='https://drive.usercontent.google.com/download?export=download&id='
source=("Zakon-Regular-${pkgver}.otf::${_dl}1I0yE7b0D9xEzVQkPhYh63D5rKGB2TK5p"
        "Zakon-Italic-${pkgver}.otf::${_dl}1lSrj756BA8YgLQ0Vu0Kfyl3k8i8rZdgU"
        "Zakon-Bold-${pkgver}.otf::${_dl}1wL4HPchd3lnwkxlkBMZckpTMszPKae7G"
        "Zakon-BoldItalic-${pkgver}.otf::${_dl}1RhlKT39HPoaB0OJ_NvQOpRjcAb4CpkcZ"
        'LICENSE')
sha256sums=('57dfb80e4cb2fcb6ae54552d7eec2a8fd69832ff41330775da026f4020da6614'
            '1e40dc3daa6bb4461d799e1450adadc0d105b8d4c1104a1f8003fb0564647e33'
            '9d0daa3d6d140b7bb5625d899b6b95bf8a5c13b7ba0cad5dd5fc31cee7712eb8'
            'c5a8214e49f8501510a9e8dea43e90f6f23cbf11b2097bb202dafbce50b90e86'
            'a2bab0064b8d6cffa7e494f7701f3dbe46eff6edc711a4ab40105214426a683a')

package() {
  local _style
  for _style in Regular Italic Bold BoldItalic; do
    install -Dm644 "Zakon-${_style}-${pkgver}.otf" \
      "${pkgdir}/usr/share/fonts/zakon/Zakon-${_style}.otf"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
