# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-armv7a-eabi

_rev=r10
_apilevel=23
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-24_r10.zip"
        "source.properties")
sha1sums=('3c904ab27e02f17e60997208617b7c11de5b8a8c'
          '878ad90552c1e1f47ed0148cfcec0296c248cfc7')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/armeabi-v7a "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
