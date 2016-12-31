# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Package Repository: https://github.com/mij-aur-packages/android-armv7a-eabi-system-image

_rev=r07
_apilevel=24
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/armeabi-v7a-24_r07.zip"
        "source.properties")
sha1sums=('3454546b4eed2d6c3dd06d47757d6da9f4176033'
          'e03457681f0105a1679cbb8af213b0c8600f9bee')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/armeabi-v7a" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/armeabi-v7a/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
