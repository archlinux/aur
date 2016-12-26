_rev=r03
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
sha1sums=('00c2c5765e8988504be10a1eb66ed71fcdbd7fe8')

package() {
      mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
        mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

          chmod -R ugo+rX "${pkgdir}/opt"
}
