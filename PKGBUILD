# Maintainer: johnguant <rhys @t johnguant dot com>

_rev=r01
_sdkver=5.1
_sdkint=22
pkgname=android-tv-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android TV ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android-tv/sysimg_atv_arm-${_sdkint}_${_rev}.zip")
sha1sums=('557b7934170caa94f9dcac174f411b747ad62328')

package() {
  install -Dm644 "${srcdir}/armeabi-v7a/NOTICE.txt" "${pkgdir}/usr/share/licenses/$pkgname/NOTICE.txt"
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/android-tv/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
