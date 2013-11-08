# Maintainer:

_sdkver=4.3
_apiver=18
_rel=r01
pkgname=android-x86-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=1
pkgdesc="Android x86 Atom System Image, API-${_apiver}"
arch=('any')
url="http://software.intel.com/en-us/articles/android-43-jelly-bean-x86-emulator-system-image"
license=('custom')
depends=("android-platform-${_apiver}")
optdepends=('qemu' 'libvirt')
options=('!strip')
source=("http://download-software.intel.com/sites/landingpage/android/sysimg_x86-${_apiver}_${_rel}.zip")
md5sums=('a158194c0d57fe9bcf03b090813859c8')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}