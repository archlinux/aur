# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r01
_sdkver=5.1
_sdkint=22
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
sha1sums=('6c7bb51e41a16099bb1f2a3cc81fdb5aa053fc15')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
