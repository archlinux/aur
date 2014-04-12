# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r04
_apilevel=19
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
source=("http://dl.google.com/android/repository/google_apis-${_apilevel}_${_rev}.zip")
sha1sums=('27f8a07d59d4744194216d11fbaef9651b518690')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}"/google_apis-[0-9]*-mac-x86 "${pkgdir}/opt/android-sdk/add-ons/addon-google_apis-google_inc_-${_apilevel}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
