# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-x86-64

_rev=r10
_apilevel=23
pkgname=android-google-apis-x86-64
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs x86-64 System Image, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform" "android-google-apis")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}" "${pkgname/x86-64/x86_64}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}" "${pkgname/x86-64/x86_64}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86_64-23_r10.zip"
        "source.properties")
sha1sums=('84b6ed3d2575d2f665159bb6e5b8cb829c41202e'
          '95a7548fc0718301af1f297da3c5fad8b71f275c')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86_64 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
