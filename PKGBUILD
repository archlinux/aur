# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-64-system-image

_rev=r04
_apilevel=23
pkgname=android-x86-64-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android x86-64 System Image, latest API"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}" "${pkgname/x86-64/x86_64}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}" "${pkgname/x86-64/x86_64}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86_64-23_r04.zip"
        "source.properties")
sha1sums=('07ba4d1c9bd0cbca28119f3bd1387c5f05e3d7c0'
          'bf63b0e677680ba63d1f7374ca454b1bd144e1c6')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86_64" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
