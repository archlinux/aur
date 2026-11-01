# Maintainer:  Alex Petrovsky <met4inf@gmail.com>

pkgname=ttf-fairfax-hd
pkgdesc='Halfwidth scalable monospace font for terminals, text editors, IDEs, etc.'
pkgver=2026.09.21
pkgrel=1
arch=('any')
license=('OFL-1.1')
# The upstream release tag predates the commit that rebuilt the binaries.
_commit='e4b81241e8c7269a91c0bd865cf5c9e7208fbada'
_fonts=('FairfaxHD' 'FairfaxSMHD' 'FairfaxHaxHD' 'FairfaxPonaHD' 'FairfaxPulaHD')
url='https://www.kreativekorp.com/software/fonts/fairfaxhd/'
_raw="https://github.com/kreativekorp/open-relay/raw/${_commit}/FairfaxHD"
source=("FairfaxHD-${pkgver}.ttf::${_raw}/FairfaxHD.ttf"
        "FairfaxSMHD-${pkgver}.ttf::${_raw}/FairfaxSMHD.ttf"
        "FairfaxHaxHD-${pkgver}.ttf::${_raw}/FairfaxHaxHD.ttf"
        "FairfaxPonaHD-${pkgver}.ttf::${_raw}/FairfaxPonaHD.ttf"
        "FairfaxPulaHD-${pkgver}.ttf::${_raw}/FairfaxPulaHD.ttf"
        "${pkgname}-${pkgver}-OFL.txt::${_raw}/OFL.txt")
sha256sums=('8ed5c84fa50fd02f145026da522b30519b1637222372d1b47b721cd021fc79ce'
            '560dd3e6bb1c0013251a06df286c384d280c5704233299ecc161d76e97c1d8b8'
            '61d9e73002a82cc46b805fb0af86409d6bae48127a6d764efc09b7e6f705c684'
            'f9a5749c015baec4d78d935291ae32d75266eb7c0b4b3eb4f1ef119c9135ebd8'
            'a1f47b9ee17c7aa0e516d9c65ef1b61e3e1be462d724c73d8e466f36dcc7c9aa'
            'f41c62b00b213a055f606b635451ee8aeb3f793a5d3846cc22ceee19a7dbb6db')

package() {
  for _font in "${_fonts[@]}"; do
    install -Dm644 "${_font}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_font}.ttf"
  done
  install -Dm644 "${pkgname}-${pkgver}-OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
