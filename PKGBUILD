# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis-x86-64

_rev=r01
_apilevel=22
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86_64-22_r01.zip"
        "source.properties")
sha1sums=('078ecd0dd702db28cb9e15c1b0d1832f944548ca'
          'ea1a7e538a0bc5397b618e4219c92b9c12f6bba7')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86_64 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
