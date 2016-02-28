# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r04
_sdkver=4.1.2
_sdkint=16
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url='http://developer.android.com/sdk/index.html'
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_armv7a-${_sdkint}_${_rev}.zip")
sha1sums=('39c093ea755098f0ee79f607be7df9e54ba4943f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
