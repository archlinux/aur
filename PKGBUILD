# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=5.0
_sdkint=21
pkgname=android-sources-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha1sums=('137a5044915d32bea297a8c1552684802bbc2e25')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
  cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
}
