# Contributor: Yen Chi Hsuan <yan12125 at gmail>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

_sdkver=5.1
_apilevel='22'
_rev='r06'
_arch='x86_64'
pkgname="android-${_arch/x86_/x86-}-system-image-${_apilevel}"
pkgver="${_sdkver}_${_rev}"
pkgrel=1
pkgdesc="Android ${_arch} System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname/x86-/x86_}-${_apilevel}")
conflicts=("${pkgname/x86-/x86_}-${_apilevel}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/${_arch}-${_apilevel}_${_rev}.zip")
sha1sums=('5db3b27f78cd9c4c5092b1cad5a5dd479fb5b2e4')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/${_arch}" "${_destdir}"

  chmod -R ugo+rX "${pkgdir}/opt"
}

# vim:set et sw=2 sts=2 tw=80:
