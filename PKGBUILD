_rev=r02
_sdkver=7.0
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
sha1sums=('8912da3d4bfe7a9f28f0e5ce92d3a8dc96342aee')

package() {
      mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
        mv "${srcdir}/android-${_sdkver}" "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

          chmod -R ugo+rX "${pkgdir}/opt"
}
