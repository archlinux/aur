# Maintainer: Yen Chi Hsuan <yan12125 at gmail>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-play-licensing
_rev=r02
pkgver="1.${_rev}"
pkgrel=1
epoch=1
pkgdesc='Google Play Licensing client library'
replaces=('android-google-market-licensing')
arch=('any')
url="https://developer.android.com/google/play/licensing/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/market_licensing-${_rev}.zip")
sha1sums=('355e8dc304a92a5616db235af8ee7bd554356254')

package() {
  install -Ddm755 "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dr --no-preserve=ownership "${srcdir}/google_market_licensing" \
      "${pkgdir}/opt/android-sdk/extras/google/play_licensing"

  install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/google_market_licensing/LICENSE.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  chmod -R ugo+rX "${pkgdir}/opt"
}
