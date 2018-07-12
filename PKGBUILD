# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from android-emulator

_pkgname=android-emulator
pkgname="${_pkgname}-dummy"
pkgver=27.3.8
pkgrel=1
_pkgdesc='Google Android Emulator'
pkgdesc="${_pkgdesc}, dummy package"
arch=('x86_64')
url='https://developer.android.com/studio/releases/emulator.html'
license=('custom')
depends=('libpulse' 'libx11' 'libxcb' 'libxdamage' 'libxext' 'libxfixes'
         'ncurses5-compat-libs' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}.sh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.sh?h=${_pkgname}"
        "${_pkgname}.csh::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.csh?h=${_pkgname}")
sha1sums=('4537a7ce30bedf87cedafc2020822219ad58310d'
          '2fb371b5774b67143f0610dfbec4963a4e2f11cc')

package() {
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -Dm755 "${_pkgname}.csh" "${pkgdir}/etc/profile.d/${_pkgname}.csh"
}

# getver: https://developer.android.com/studio/releases/emulator.html
# see https://dl.google.com/android/repository/repository2-1.xml for new versions
# vim:set ts=2 sw=2 et:
