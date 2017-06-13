# Maintainer: Yen Chi Hsuan <yan12125 at gmail>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-apk-expansion
_rev=r03
pkgver="1.${_rev}"
pkgrel=1
epoch=1
pkgdesc='Google Play APK Expansion library'
replaces=('android-google-market-apk-expansion')
arch=('any')
url="https://developer.android.com/google/play/expansion-files.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_apk_expansion-${_rev}.zip")
sha1sums=('5305399dc1a56814e86b8459ce24871916f78b8c')

package() {
  install -Ddm755 "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dr --no-preserve=ownership "${srcdir}/google_market_apk_expansion" \
      "${pkgdir}/opt/android-sdk/extras/google/play_apk_expansion"

  install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/google_market_apk_expansion/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  chmod -R ugo+rX "${pkgdir}/opt"
}
