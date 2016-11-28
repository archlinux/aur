# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r07
_sdkver=7.0
_sdkint=24
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/armeabi-v7a-${_sdkint}_${_rev}.zip")
sha1sums=('3454546b4eed2d6c3dd06d47757d6da9f4176033')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
