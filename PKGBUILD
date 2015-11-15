pkgname=android-google-play-services
pkgver=r28
_build=8298000
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
md5sums=('1d3822bf1b81b5a68be75f35c7f700d3'
         'b0ef98af96c034d27a4e45f21363d83e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
