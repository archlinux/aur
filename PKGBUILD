# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-system-image

_rev=r05
_apilevel=23
pkgname=android-x86-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, latest API"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86-23_r05.zip"
        "source.properties")
sha1sums=('81c847d168bbc24224d3f6950ab935614f1e36fc'
          '5db297edaa6020bd6604ef9cd1d78f45e3b940f8')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
