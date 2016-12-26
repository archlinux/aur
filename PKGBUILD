pkgname=android-google-play-services
pkgver=r38
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("https://dl.google.com/android/repository/google_play_services_v8_rc41.zip" "source.properties")
md5sums=('07acf5918ab07128e4547df1d494c8be'
         '285b51d1fda27a17d6542d4f37d0937b')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
