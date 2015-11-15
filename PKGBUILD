# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-64-system-image

_rev=r05
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86_64-23_r05.zip"
        "source.properties")
sha1sums=('b4b2279361406ffdcb79a8e0f1031a43d35b4e55'
          'db4ff24bd7ecb5aed28e14d15d2dbc4055b93f14')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86_64" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
