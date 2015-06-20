# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-takao
pkgver=15.03
pkgrel=1
_filever=00303.01
pkgdesc="Japanese outline fonts based on IPA Fonts (otf-ipafont)"
arch=('any')
url="https://launchpad.net/takao-fonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://launchpad.net/takao-fonts/trunk/${pkgver}/+download/TakaoFonts_${_filever}.tar.xz)
md5sums=('8cd3fe724faa5034a9369e98cf108d2d')

package() {
  cd "${srcdir}/TakaoFonts_${_filever}"

  install -d "${pkgdir}/usr/share/fonts/OTF"

  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
          README \
          README.ja \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}

