# Maintainer: Christoph Bayer <chrbayer@criby.de>

_rev=r06
_sdkver=5.1
_sdkint=22
pkgname=android-x86-system-image-22
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/x86-${_sdkint}_${_rev}.zip")
sha256sums=('aa72bfcc81dcea09efb8bd7dcdf108b6a85c11bca1b287a64fa1a90d2cdd3538')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkint}/default/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
