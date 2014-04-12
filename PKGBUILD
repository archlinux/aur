# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r03
_sdkver=4.4.2
_apilevel=19
pkgname=android-platform
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl.google.com/android/repository/android-${_apilevel}_${_rev}.zip")
sha1sums=('5f33d8fd36a384fe2b170035e04a29c274a9ef95')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
