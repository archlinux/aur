pkgname=android-google-play-services
pkgver=r42
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("https://dl.google.com/android/repository/google_play_services_v11.2_rc08.zip" "source.properties")
md5sums=('447414247778fed5b3d669bab6d5d668'
         '97e5af3865728294c315f33e8926931b')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
