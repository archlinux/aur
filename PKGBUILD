# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_rev=r01
_apilevel=21
pkgname=android-x86-system-image
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android x86 Atom System Image, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/sysimg_x86-21_r01.zip")
sha1sums=('1b5d4228736afc32c7ad1439740abb39b1bc0fae')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86" "${_destdir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
