# Maintainer: Tom Vincent <aur@tlvince.com>
_sdkver=4.2.2
_apiver=17
_rel=r02
pkgname=android-x86-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=1
pkgdesc="Android x86 Atom System Image, API-${_apiver}"
arch=('any')
url="https://software.intel.com/en-us/android/articles/intel-atom-x86-image-for-android-4-2-jelly-bean-installation-instructions-recommended"
license=('custom')
depends=("android-platform-${_apiver}")
optdepends=('qemu' 'libvirt')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/sysimg_x86-${_apiver}_${_rel}.zip")
sha1sums=('bd8c7c5411431af7e051cbe961be430fc31e773d')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/x86"
  chmod -R ugo+rX "${pkgdir}/opt"
}
