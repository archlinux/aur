# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-armv7a-eabi-system-image

_rev=r03
_apilevel=23
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_arm-23_r03.zip"
        "source.properties")
sha1sums=('7bb8768ec4333500192fd9627d4234f505fa98dc'
          'c259150d426672ddbd6dc33819984a502eb0f0c9')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/armeabi-v7a" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/armeabi-v7a/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
