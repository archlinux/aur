# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis

_rev=r1
_apilevel=25
pkgname=android-google-apis
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs, latest API"
arch=('any')
url="https://developers.google.com/android"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_apis-${pkgver}.zip"
        "source.properties")
sha256sums=('351a5877d03821465fcd583e61ebe7c3315d234bf0af124a6359961d7858ed2e'
            'c83a87d77c6b3b65ba63e62fac8194631895e92c32d555aaab069f78b8c310ee')

package() {
  _destdir="${pkgdir}/opt/android-sdk/add-ons/"
  _apidir="addon-google_apis-google_inc_-${_apilevel}"
  _apisrcdir=$(echo "${srcdir}"/google_phone_x86-[0-9]*-linux-x86)

  mkdir -p "${_destdir}"
  mv "${_apisrcdir}" "${_destdir}/${_apidir}"
  install -Dm644 "${srcdir}/source.properties"  "${_destdir}/${_apidir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
