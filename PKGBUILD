# Maintainer: Joel Pedraza <joel@joelpedraza.com>

_sdkver=4.0.4
_apiver=15
_rel=r02
pkgname=android-x86-system-image-${_apiver}
pkgver=${_sdkver}_${_rel}
pkgrel=2
pkgdesc="Android x86 Atom System Image, API-${_apiver}"
arch=('any')
url="http://software.intel.com/en-us/articles/android-ice-cream-sandwich-x86-emulator-image"
license=('custom')
depends=("android-platform-${_apiver}")
optdepends=('qemu' 'libvirt')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/sysimg_x86-${_apiver}_${_rel}.zip")
sha1sums=('56b8d4b3d0f6a8876bc78d654da186f3b7b7c44f')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/"
  mv "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_apiver}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
