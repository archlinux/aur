# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

_rev=r02
_sdkver=5.1.1
_sdkint=22
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
source=("http://dl.google.com/android/repository/android-${_sdkint}_${_rev}.zip")
sha1sums=('5d1bd10fea962b216a0dece1247070164760a9fc')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
