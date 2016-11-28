_rev=r02
_sdkver=7.1.1
_sdkint=25
pkgname=android-platform-${_sdkint,,}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
conflicts=("android-platform==${_sdkint,,}")
options=('!strip')
source=("http://dl.google.com/android/repository/platform-${_sdkint}_${_rev}.zip")
sha1sums=('6057e54a04f1d141f36a2c8d20f2962b41a3183f')

package() {
      mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
        mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

          chmod -R ugo+rX "${pkgdir}/opt"
}
