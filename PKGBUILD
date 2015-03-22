# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis

_rev=r01
_apilevel=22
pkgname=android-google-apis
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-22_r01.zip"
        "source.properties")
sha1sums=('5def0f42160cba8acff51b9c0c7e8be313de84f5'
          'a123d703f71ac5f6724bcab570fe84c9b2eb043f')

package() {
  _destdir="${pkgdir}/opt/android-sdk/add-ons/"
  _apidir="addon-google_apis-google_inc_-${_apilevel}"
  _apisrcdir=$(echo "${srcdir}"/google_phone_armv7-[0-9]*-mac-x86)

  mkdir -p "${_destdir}"
  mv "${_apisrcdir}" "${_destdir}/${_apidir}"
  install -Dm644 "${srcdir}/source.properties"  "${_destdir}/${_apidir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
