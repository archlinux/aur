# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Rocky Prabowo <rocky at lazycats dot id>

_pkgbase='nerd-fonts'
_font_name='Meslo'
_font_pkgbase='ttf-meslo'
_font_pkgname='meslo'
_nerdfonts_source='Meslo.zip'

pkgname=${_pkgbase}-${_font_pkgname}
pkgver=2.2.2
pkgrel=2
pkgdesc="Standalone ${_font_name} (${_font_pkgbase}) patched font from the ${_pkgbase} library"
arch=("any")
url="https://github.com/ryanoasis/${_pkgbase}"
license=('MIT')
depends=('fontconfig')
provides=( ${pkgname} )
conflicts=( ${_pkgbase}-git ${_pkgbase}-complete )
groups=( ${_pkgbase} )
source=("${pkgname}-${pkgver}::https://github.com/ryanoasis/${_pkgbase}/releases/download/v${pkgver}/${_nerdfonts_source}"
        "https://github.com/ryanoasis/${_pkgbase}/raw/v${pkgver}/LICENSE")
sha1sums=('d57d073835504b217c4a2c13042ad637eed947e0'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
