_rev=r01
_sdkver=N
_sdkint=24
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
sha1sums=('b58f5dd3f60ee0fbaa09cce6372157c36c688075')

package() {
      mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
        mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

          chmod -R ugo+rX "${pkgdir}/opt"
}
