# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis

_rev=r01
_apilevel=23
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
source=("http://dl-ssl.google.com/android/repository/google_apis-23_r01.zip"
        "source.properties")
sha1sums=('04c5cc1a7c88967250ebba9561d81e24104167db'
          'f964af7b906e23ec7df84023190209c77e6df382')

package() {
  _destdir="${pkgdir}/opt/android-sdk/add-ons/"
  _apidir="addon-google_apis-google_inc_-${_apilevel}"
  _apisrcdir=$(echo "${srcdir}"/google_phone_x86-[0-9]*-mac-x86)

  mkdir -p "${_destdir}"
  mv "${_apisrcdir}" "${_destdir}/${_apidir}"
  install -Dm644 "${srcdir}/source.properties"  "${_destdir}/${_apidir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
