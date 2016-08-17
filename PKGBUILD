pkgname=android-google-play-services
pkgver=r32
_build=945200
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
sha512sums=('291d0c097860a7d5dda6bbb006007859dc185fbea350bc51b97e571cf4334d0f982a683d5daf8a299efbdc39974a194bd658e0ac860f715e1bb83e447df4527d'
            'ae6bc1cc4d5b68dfc48a9d6f8dbe6cff834058aa7f799b9e552ddc9705870d279b65bac79a38290d10175e5ef2aec7029ca5da25f30f49b00c0759d669dfc3e4')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
