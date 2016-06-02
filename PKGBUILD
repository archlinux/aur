# Maintainer: Quint Guvernator <quint@guvernator.net>

_rev=r05
_sdkver=4.4.2
_sdkint=19
pkgname=android-x86-system-image-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_x86-${_sdkint}_${_rev}.zip")
sha1sums=('c9298a8eafceed3b8fa11071ba63a3d18e17fd8e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
