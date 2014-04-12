# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkver=4.4.2
_apilevel=19
pkgname=android-armv7a-eabi-system-image
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, latest API'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl.google.com/android/repository/sysimg_armv7a-${_apilevel}_${_rev}.zip")
sha1sums=('e0d375397e28e3d5d9577a00132463a4696248e5')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
