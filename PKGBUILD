# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r02
_apilevel=21
pkgname=android-x86-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=2
pkgdesc="Android x86 Atom System Image, latest API"
arch=('any')
url='http://developer.android.com/tools/devices/emulator.html'
#url="https://software.intel.com/en-us/articles/android-4-4-kitkat-x86-emulator-system-image"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/google_apis/sysimg_x86-${_apilevel}_${_rev}.zip"
        "source.properties")
sha1sums=('bb00e3d8675a80b09dfbdef813789efdaa1304a8'
          '15d4392cada9b437fcd75ad542d4017f26e71eb5')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86" "${_destdir}"
  mv "${srcdir}/source.properties" "${_destdir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
