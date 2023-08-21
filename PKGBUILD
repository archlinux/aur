# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-armv7a-eabi

_rev=r18
_apilevel=25
pkgname=android-google-apis-armv7a-eabi
pkgver=${_apilevel}_${_rev}
pkgrel=2
pkgdesc="Android Google APIs ARM EABI v7a System Image, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform" "android-google-apis")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}" "${pkgname/armv7a/armv7}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}" "${pkgname/armv7a/armv7}-${_apilevel}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-${_apilevel}_${_rev}.zip"
        "source.properties")
sha256sums=('0e888e3141ec4bf55494cbbb268e91fab60de7bf5163f85a40a4bab7e31032ff'
          'ac29706b26aa46ea9e9e801bbc6cbc2ad7a761555b57f9a53bddf613f9414c25')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/armeabi-v7a "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
