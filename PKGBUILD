# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r02
_apilevel=21
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86-21_r02.zip"
        "source.properties")
sha1sums=('bb00e3d8675a80b09dfbdef813789efdaa1304a8'
          '39991f0861654fc5e118a87514503c3ce2368223')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
