# Maintainer: farwayer <farwayer@gmail.com>

_rev=r06
_sdkver=9
_sdkint=28
pkgname=android-platform-${_sdkint,,}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
conflicts=("android-platform==${_sdkint,,}")
options=('!strip')
source=("http://dl.google.com/android/repository/platform-${_sdkint}_${_rev}.zip")
sha1sums=('9a4e52b1d55bd2e24216b150aafae2503d3efba6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
