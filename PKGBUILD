# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r06
_sdkver=7.0
_sdkint=24
pkgname=android-arm64-v8a-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM 64 v8a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_arm64-v8a-${_sdkint}_${_rev}.zip")
sha1sums=('ffc9af8bf3162ed42f48e1954cd0cf616d348f85')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"

  chmod -R ugo+rX "${pkgdir}/opt"
}
