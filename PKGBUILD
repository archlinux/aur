# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-google-apis

_rev=r01
_apilevel=21
pkgname=android-google-apis
pkgver=${_apilevel}_${_rev}
pkgrel=2
pkgdesc="Android Google APIs, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl.google.com/android/repository/google_apis-${_apilevel}_${_rev}.zip"
        "source.properties")
sha1sums=('66a754efb24e9bb07cc51648426443c7586c9d4a'
          '15c66b396eae5eda6886574f3894105a6f7e9e13')

package() {
  _destdir="${pkgdir}/opt/android-sdk/add-ons/"
  _apidir="addon-google_apis-google_inc_-${_apilevel}"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/google_phone_x86-[0-9]*-linux-x86 "${_destdir}/${_apidir}"
  install -Dm644 "${srcdir}/source.properties"  "${_destdir}/${_apidir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
