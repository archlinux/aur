# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-ipamjfont
pkgver=005.01
_pkgver=${pkgver/./}
pkgrel=1
pkgdesc="Japanese outline Mincho fonts implementing IVS compliant with Hanyo-Denshi collection (based on IPAex Mincho fonts)"
arch=('any')
url="http://mojikiban.ipa.go.jp/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://dforest.watch.impress.co.jp/library/i/ipamjfont/10750/ipamjm${_pkgver}.zip)
sha1sums=('3fbb45d5b5223e7052544acf0c2400ce26f5f8db')
#source=(http://dl.mojikiban.ipa.go.jp/IPAmjMincho/ipamjm${_pkgver}.zip)

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt Readme.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}
