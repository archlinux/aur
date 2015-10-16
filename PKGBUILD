# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-ipaexfont
pkgver=003.01
_pkgver=${pkgver//./}
pkgrel=1
pkgdesc="Japanese outline fonts following the tradition of Japanese printing font"
arch=('any')
url="http://ipafont.ipa.go.jp/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-ipaex')
replaces=('ttf-ipaex')
install=otf.install
source=(http://dl.ipafont.ipa.go.jp/IPAexfont/IPAexfont${_pkgver}.zip)
sha1sums=('23f49d22e8928df5356f1248210bdf1b0b93af12')

package() {
  cd "${srcdir}/IPAexfont${_pkgver}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt Readme_IPAexfont${_pkgver}.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
