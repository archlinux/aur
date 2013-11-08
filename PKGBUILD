# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=4.4
_sdkint=19
pkgname=android-armv7a-eabi-system-image
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, latest API'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_sdkint}")
conflicts=("${pkgname}-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sysimg_armv7a-${_sdkint}_${_rev}.zip")
sha1sums=('12dd1187dfd953b1ffcef5067d94578590f9e600')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
