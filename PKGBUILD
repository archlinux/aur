# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r03
_apilevel=21
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86_64-21_r03.zip"
        "source.properties")
sha1sums=('bdce60caddf0ae4523049192fe81da8056a8cc6e'
          '7b4e7d851f7ed2a82707d97609e6630d405606ed')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86_64 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
