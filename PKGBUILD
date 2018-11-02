#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkint=28
_sdkver=9.0.0
pkgname="android-sources-${_sdkint}"
pkgver="${_sdkver}_${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=(any)
url="https://developer.android.com/studio/index.html"
license=('custom')
provides=("android-sources")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha256sums=('7c05aecdc5b56a8d30837ff80885e95736e455aef4d442a5f5f39fe9652250f0')


package() {
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
}