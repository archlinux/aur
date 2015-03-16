# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-armv7a-eabi-system-image

_rev=r01
_apilevel=22
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_arm-22_r01.zip"
        "source.properties")
sha1sums=('2aa6a887ee75dcf3ac34627853d561997792fcb8'
          'be0f8cc96b89bb98764be3108056d3db18c5f730')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/armeabi-v7a" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/armeabi-v7a/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
