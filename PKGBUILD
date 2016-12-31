# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-system-image

_rev=r07
_apilevel=24
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/x86-24_r07.zip"
        "source.properties")
sha1sums=('566fdee283a907854bfa3c174265bc31f396eabd'
          '7a94c9158654c46449a3c32a39d4f52f1bafdc59')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
