# Packager: Rocky Prabowo <rocky at lazycats dot id>
# Maintainer: Rocky Prabowo <rocky at lazycats dot id>

_pkgbase='nerd-fonts'
_font_name='Meslo'
_font_pkgbase='ttf-meslo'
_font_pkgname='meslo'
_nerdfonts_source='Meslo.zip'

pkgname=${_pkgbase}-${_font_pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="Standalone ${_font_name} (${_font_pkgbase}) patched font from the ${_pkgbase} library"
arch=("any")
url="https://github.com/ryanoasis/${_pkgbase}"
license=('MIT')
depends=('fontconfig')
provides=( ${pkgname} )
conflicts=( ${_pkgbase}-git ${_pkgbase}-complete )
groups=( ${_pkgbase} )
source=("https://github.com/ryanoasis/${_pkgbase}/releases/download/v${pkgver}/${_nerdfonts_source}"
        "https://github.com/ryanoasis/${_pkgbase}/raw/v${pkgver}/LICENSE")
sha1sums=('6f1a11b0b8a2560ed35fec89dac5958d100919ec'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
