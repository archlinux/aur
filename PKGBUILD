# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-ipamjfont
pkgver=004.01
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc="Japanese outline Mincho fonts implementing IVS compliant with Hanyo-Denshi collection (based on IPAex Mincho fonts)"
arch=('any')
url="http://mojikiban.ipa.go.jp/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://dforest.watch.impress.co.jp/library/i/ipamjfont/10750/ipamjm${_pkgver}.zip)
sha1sums=('6ebc67edcfd34718925657137ad9b39fa70f2c00')
#source=(http://dl.mojikiban.ipa.go.jp/IPAmjMincho/ipamjm${_pkgver}.zip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt Readme_ipamjm${pkgver}.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}
