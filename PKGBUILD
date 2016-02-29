# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_rev=r02
_sdkver=L
_sdkint=20
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_arm-${_sdkver}_${_rev}.zip")
sha1sums=('d2b10bf52fd223b087434ae6c3651a76133dfacf')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/default/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
