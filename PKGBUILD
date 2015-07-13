# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-apk-expansion
pkgver=r03
pkgrel=1
pkgdesc='Google Play APK Expansion library'
replaces=('android-google-market-apk-expansion')
arch=('any')
url="http://developer.android.com/guide/google/play/expansion-files.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_apk_expansion-${pkgver}.zip" "source.properties")
sha1sums=('5305399dc1a56814e86b8459ce24871916f78b8c'
          '9c3a0dd44d86244e5d2ba7940117778eb8036b33')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/google_market_apk_expansion" "${pkgdir}/opt/android-sdk/extras/google/play_apk_expansion"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_apk_expansion/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
