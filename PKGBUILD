# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Taken from android-emulator

_pkgname=android-emulator
pkgname="${_pkgname}-dummy"
pkgver=37.2.13
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
sha1sums=('7e6d0b8932c816d26aa21aa5b44fc361a96c0d5a'
          'e1485ef14463f275005cae43a0a1e43ce52354ca')

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
}
