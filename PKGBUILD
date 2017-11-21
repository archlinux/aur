_rev=r02
_sdkver=8.0.0
_sdkint=26
pkgname=android-platform-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
conflicts=("android-platform-${_sdkint}")
options=('!strip')

source=("https://dl.google.com/android/repository/platform-${_sdkint}_${_rev}.zip")
sha1sums=('e4ae5d7aa557a3c827135838ee400da8443ac4ef')

package() {
  install -Ddm755 "${pkgdir}/opt/android-sdk/platforms/"
  cp -dr --no-preserve=ownership "${srcdir}/android-${_sdkver}" \
      "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
