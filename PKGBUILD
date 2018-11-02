#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkint=27
_sdkver=8.1.0
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
sha256sums=('8e3c1f85fc147b567f342552d6ead2e526df6ba6aa283264e4ebbf1f823be5cc')


package() {
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
}