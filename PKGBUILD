pkgname=android-google-play-services
pkgver=r31
_build=9256000
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
sha512sums=('8e27833e42c4bf0bb559e578ab5a69b1cd4ed2f3cff79c3ff623421b8d22e69c0b854bae0fcc03087eb5724df942fd1cfa6a67f37f918fe080d3c327aa991076'
            '8dc907fc7f14425bc0ec195525037ba1818ab010aae65a2344ba56611db9555eb6f8656d2cca197bdacab1da168c25da7ef0e6b4677fe4c1b7bbf9dbe3fd5ee5')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  cp -dpr --no-preserve=ownership "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services/source.properties"
}
