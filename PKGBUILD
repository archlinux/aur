# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r02
_apilevel=21
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_arm-21_r02.zip"
        "source.properties")
sha1sums=('3b86f52b0141e3d9d52ae80af6e12037cc4a670f'
          'cd4ff2d2aac156aca26daf148514d868241226ad')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/armeabi-v7a "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
