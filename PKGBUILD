pkgname=android-google-play-services
pkgver=r33
_build=9683000
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
sha512sums=('cd5990d4153779522f67fd7cb78b1f06a7f54820ca643001bccdcb3756dacfd6459a266b64b56af786538fe389b77d70f24b799267b259f22d628aa2a422ab2a'
            '7aaf7febbcc3377297d561e0f22827bd1dfd55a9a17f12526bc2075b197e6ca157a5c25edf40161b6327b24aedbed7918f91d7a182e6c6b574d7dbe038019e53')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
