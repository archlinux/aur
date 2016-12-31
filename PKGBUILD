# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/android-x86-64-system-image

_rev=r07
_apilevel=24
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
source=("http://dl-ssl.google.com/android/repository/sys-img/android/x86_64-24_r07.zip"
        "source.properties")
sha1sums=('a379932395ced0a8f572b39c396d86e08827a9ba'
          '50a14dedd03146ed1b7cde12cf83b9691ce22a5c')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/x86_64" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/x86_64"

  chmod -R ugo+rX "${pkgdir}/opt"
}
