# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

_rev=r02
_sdkver=5.0.1
_sdkint=21
pkgname=android-platform-${_sdkint,,}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
options=('!strip')
source=("http://dl.google.com/android/repository/android-${_sdkint}_${_rev}.zip")
sha512sums=('a4e68fe01369505499c9f0a99a228a7717a73f6e74ef0a59dc3f0bd48706a715b132b5ba4ca5a484dafd465c2ab08a5fbe525b487c62824fca2fab44cade809c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
