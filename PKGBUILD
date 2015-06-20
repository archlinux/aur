pkgname=android-google-play-services
pkgver=r25
_build=7571000
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
md5sums=('3354f1f10af385732c00326a33042251'
         '9a7a2458bb13ee3bb0fdfedb7de34f9c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
