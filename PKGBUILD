# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-ipaexfont
pkgver=002.01
_pkgver=${pkgver//./}
pkgrel=1
pkgdesc="Japanese outline fonts following the tradition of Japanese printing font"
arch=('any')
url="http://ossipedia.ipa.go.jp/ipafont/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-ipaex')
replaces=('ttf-ipaex')
install=otf.install
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.sourceforge.jp/ipafonts/57330/IPAexfont${_pkgver}.zip)
md5sums=('7bf84182a04a9632268dbcb03f100d05')

package() {
  cd "${srcdir}/IPAexfont${_pkgver}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt Readme_IPAexfont${_pkgver}.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

