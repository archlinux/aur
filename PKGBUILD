# Contributor: Andrea Scarpino <andrea@archlinux.org>

_rev=r01
_sdkver=L
_sdkint=20
pkgname=android-sources-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android SDK Sources, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/sources-${_sdkint}_${_rev}.zip")
sha1sums=('8da3e40f2625f9f7ef38b7e403f49f67226c0d76')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/sources/"
  cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
  chmod -R ugo+rX "${pkgdir}/opt"
}
