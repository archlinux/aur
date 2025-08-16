# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Taken from android-emulator

_pkgname=android-emulator
pkgname="${_pkgname}-dummy"
pkgver=36.1.9
pkgrel=1
_pkgdesc='Google Android Emulator'
pkgdesc="${_pkgdesc}, dummy package"
arch=('x86_64')
url='https://developer.android.com/studio/releases/emulator.html'
license=('custom')
depends=('dbus' 'expat' 'gcc-libs' 'glibc' 'libbsd' 'libice' 'libpng'
         'libpulse' 'libsm' 'libtiff' 'libx11' 'libxcb' 'libxext'
         'libxi' 'libxkbfile' 'nspr' 'nss' 'util-linux-libs' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}.sh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.sh?h=${_pkgname}"
        "${_pkgname}.csh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.csh?h=${_pkgname}")
sha1sums=('80c9b3ffc8865b5f8e55b1ffed36c08ee7a9d8ad'
          'e1485ef14463f275005cae43a0a1e43ce52354ca')

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
}
