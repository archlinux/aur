# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-licensing
pkgver=r02
pkgrel=1
pkgdesc='Google Play Licensing client library'
replaces=('android-google-market-licensing')
arch=('any')
url="http://developer.android.com/guide/publishing/licensing.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_licensing-${pkgver}.zip" "source.properties")
sha1sums=('355e8dc304a92a5616db235af8ee7bd554356254'
          'e52cbb3f56f3354e6375c7afd01cb886ef91335b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/google_market_licensing" "${pkgdir}/opt/android-sdk/extras/google/play_licensing"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/play_licensing/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
