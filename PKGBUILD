# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-system-image

_rev=r01
_apilevel=21
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86-21_r01.zip"
        "source.properties")
sha1sums=('1b5d4228736afc32c7ad1439740abb39b1bc0fae'
          'f5c8ed5a05b94dac9146e85f1bc262dc5db8d65c')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
