#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkint=29
_sdkver=10.0.0
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
sha256sums=('aed4feed3a30ad6b43aa79be6885218985c5425d26e74bd41f3a4c329de2459a')


package() {
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
}
