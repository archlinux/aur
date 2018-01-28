# Maintainer: Bence Hornák <hornak dot bence at gmail dot com>

_rev=r01
_sdkint=26
pkgname="android-sources-${_sdkint}"
pkgver="${_sdkint}_${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=(any)
url="https://developer.android.com/studio/index.html"
license=('custom')
conflicts=("android-sources=${_sdkint}")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha1sums=('2af701ee3223d580409288540b1d06932fd8f9b9')


package() {
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
}
