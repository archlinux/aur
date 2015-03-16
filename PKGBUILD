# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-armv7a-eabi

_rev=r01
_apilevel=22
pkgname=android-google-apis-armv7a-eabi
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs ARM EABI v7a System Image, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform" "android-google-apis")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}" "${pkgname/armv7a/armv7}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}" "${pkgname/armv7a/armv7}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_arm-22_r01.zip"
        "source.properties")
sha1sums=('70273783312d4519f8b503cdd8be980180fb1197'
          '3194256dfcb72d41fa3159148aeedf6ed4821640')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/armeabi-v7a "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
