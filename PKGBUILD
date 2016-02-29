# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkver=4.3
_sdkint=18
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, API-${_sdkint}'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sysimg_armv7a-${_sdkint}_${_rev}.zip")
sha1sums=('4a1a93200210d8c42793324362868846f67401ab')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
