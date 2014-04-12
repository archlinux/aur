# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r01
_sdkver=4.3
_apilevel=18
pkgname=android-x86-system-image
pkgver=${_sdkver}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, latest API"
arch=('any')
url="http://software.intel.com/en-us/articles/android-43-jelly-bean-x86-emulator-system-image"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://download-software.intel.com/sites/landingpage/android/sysimg_x86-${_apilevel}_${_rev}.zip")
md5sums=('a158194c0d57fe9bcf03b090813859c8')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/"
  mv "${srcdir}/x86" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
