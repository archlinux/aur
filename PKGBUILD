# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r02
_sdkver=4.3
_apilevel=19
pkgname=android-x86-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, latest API"
arch=('any')
url="https://software.intel.com/en-us/articles/android-4-4-kitkat-x86-emulator-system-image"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/x86/sysimg_x86-${_apilevel}_${_rev}.zip")
sha1sums=('8889cb418984a2a7916a359da7c429d2431ed060')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/"
  mv "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
