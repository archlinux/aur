# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r03
_sdkver=6.0
_sdkint=23
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_arm-${_sdkint}_${_rev}.zip")
sha1sums=('7bb8768ec4333500192fd9627d4234f505fa98dc')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
