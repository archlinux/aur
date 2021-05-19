# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
# Contributor: Christoph Bayer <chrbayer@criby.de>

_rev=r06
_sdkver=6.0
_sdkint=23
pkgname=android-armv7a-eabi-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android ARM EABI v7a System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/android/armeabi-v7a-${_sdkint}_${_rev}.zip")
sha256sums=('93b1bf35cecc3dee3a8ff21982f231e725f4a957681b2023898715adc851a04e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/armeabi-v7a" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/armeabi-v7a"

  chmod -R ugo+rX "${pkgdir}/opt"
}
