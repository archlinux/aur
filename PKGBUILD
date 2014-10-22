# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_apilevel=21
pkgname=android-armv7a-eabi-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc='Android ARM EABI v7a System Image, latest API'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform")
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_arm-${_apilevel}_${_rev}.zip")
sha1sums=('3b86f52b0141e3d9d52ae80af6e12037cc4a670f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/"
  mv "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
