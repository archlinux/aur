_rev=r01
_sdkint=32
_sdkver=12.1.0
pkgname="android-sources-${_sdkint}"
pkgver="${_sdkint}_${_sdkver}_${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
provides=("android-sources")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha256sums=('7ebf6cb75df1b1838aedaf9eba15663f786611e1bcfbd36db2765ba410c4f345')


package() {
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
}
