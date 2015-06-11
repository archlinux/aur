# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

_sdkver=21
_sdkint=21
_rel=r03
pkgname=android-x86-system-image-${_sdkint,,}
pkgver=${_sdkver}_${_rel}
pkgrel=2
pkgdesc="Android x86 Atom System Image, API-${_sdkint}"
arch=('any')
url="https://software.intel.com/en-us/android/tools"
license=('custom')
depends=("android-platform-${_sdkint,,}")
optdepends=('qemu' 'libvirt')
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_x86-${_sdkver}_${_rel}.zip")
sha512sums=('91744a516f9bf77d01bca62091976b44f03a63ce43528c5633efad484f47e8f94e0c23cdde85f77b5a041459097f5ed37e8446fe59f2dde41c683952eb70cf4e')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/default"
  cp -dpr --no-preserve=ownership "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_sdkver}/default/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
