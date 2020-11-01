# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.ttf

_pkgname='ezhuthu'
pkgname="ttf-${_pkgname}"

pkgver=1.0
pkgrel=1
_commit_character_set='0b7a7404538d117d8100e8b0934554e0387ffab2'

pkgdesc='Ezhuthu Malayalam handwriting style font'
arch=('any')
url='http://rachana.org.in'
_url_source='https://gitlab.com/rit-fonts/ezhuthu'
license=('OFL')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${_pkgname}-${pkgver}.ttf::${url}/downloads/${_pkgname^}-Regular.ttf"
        "character-set-${_commit_character_set}::${_url_source}/-/raw/${_commit_character_set}/${_pkgname^}-character-set.pdf"
        "${_pkgname}-${pkgver}-specimen::http://books.sayahna.org/ml/pdf/${_pkgname}.pdf")
sha256sums=('039df7d4aa24005b2fabf21bc11cd6b1c872a1346d1209702d8bf01ffcc0b0d5'
            '82b163fcbbe1c4bd859f8398fefd77639bd09f9712e78851e42415cac6108f6d'
            'cecbcd5bc0ef9eadd0dbc1ca329d154029f8128eed72d2822abaaf82c8282932')

package() {
  install -Dvm644 "${_pkgname}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_pkgname}.ttf"
  install -Dvm644 "character-set-${_commit_character_set}" "${pkgdir}/usr/share/doc/${pkgname}/character-set.pdf"
  install -Dvm644 "${_pkgname}-${pkgver}-specimen" "${pkgdir}/usr/share/doc/${pkgname}/specimen.pdf"
}

# vim:set ts=2 sw=2 et:
