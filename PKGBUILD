# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-x86

_rev=r09
_apilevel=23
pkgname=android-google-apis-x86
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs x86 System Image, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform" "android-google-apis")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86-23_r09.zip"
        "source.properties")
sha1sums=('5b694652c292262fcb7ec675961f59a718905afc'
          '19a6d9ecaba60d558e409a787c79177d8f36aae8')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
