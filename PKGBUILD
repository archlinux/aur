# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-x86-64

_rev=r08
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86_64-23_r08.zip"
        "source.properties")
sha1sums=('8b744b0806417bbbd8967d4fb7574e55f7ee2a23'
          '1a896bc7cc53a0f024f48717ea8a0223d8dda4f9')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86_64 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
