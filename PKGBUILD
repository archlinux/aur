# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

_rev=r03
_sdkver=6.0
_sdkint=23
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
sha1sums=('027fede3de6aa1649115bbd0bffff30ccd51c9a0')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
