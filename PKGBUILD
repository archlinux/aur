# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkver=4.4.2
_sdkint=19
pkgname=android-platform
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
provides=("${pkgname}-${_sdkint}")
conflicts=("${pkgname}-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/android-${_sdkint}_${_rev}.zip")
sha1sums=('fb87a779320bcb8a0a0932f6db8843ba72d1993b')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
