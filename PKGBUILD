# Maintainer: Uģis Ģērmanis <ugis@germanis.lv>
_name=melodfy
pkgname=${_name}-bin
_build=29
pkgver=v1.0.0+${_build}
pkgrel=1
pkgdesc="Melodfy✨: AI-Powered Piano Audio to MIDI Converter 🎶"
arch=('x86_64')
url="https://github.com/HemantKArya/Melodfy"
license=('MIT')
depends=(wine)
source=("${_name}"
        "${pkgname}-${pkgver}.zip::https://github.com/HemantKArya/${_name^}/releases/download/${pkgver}/${_name^}_Windows_Build_${_build}.zip"
        "${_name}.desktop"
        "${_name}.png"
        )
options=(!strip)
install="${_name}.install"
sha256sums=('e9c53373e2bc70df9a75cc2c051268f791b564a29b52c0c7d2953abaed0b3a55'
            'a33ebd4dbf34b105f7f22a60b2340e4e0a5391d1ed108f7a0da50117c604df29'
            '973d3628e0c42263d90a9eb9f1c056d0a13919fc3b6493f063f41c4716ad6b00'
            '80a180b3b4a8545f9187795f60ec2c0c7c14fac68187aacb15a5c7dffd67966d')

package() {
  install -d -m755 "${pkgdir}/usr/share/${_name}"
  cp -ra "${srcdir}/${_name^}"/* "${pkgdir}/usr/share/${_name}"
  find "${pkgdir}/usr/share/${_name}" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/${_name}" -type f -exec chmod 644 "{}" \;

  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 "${_name}" "${pkgdir}/usr/bin" 

  install -Dm0644 ${_name}.png "${pkgdir}/usr/share/pixmaps/${_name}.png"
  install -Dm0644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"
}