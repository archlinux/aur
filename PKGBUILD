# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

pkgname=steamcmd
pkgver=latest
pkgrel=3
pkgdesc="Steam Command Line Tools"
arch=('i686' 'x86_64')
license=('custom')
url=http://developer.valvesoftware.com/wiki/SteamCMD
source=(https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz steamcmd)
md5sums=('70a38a1c8688d170c48b7f4990782c7a'
         '5de1fddd114f10ff5d2a8fbeee044a8f')
install='steamcmd.install'
depends_x86_64=('lib32-gcc-libs')

package() {
  # sh script
  install -D -m755 "${srcdir}/steamcmd" "${pkgdir}/usr/bin/steamcmd"

  # in base folder
  install -D -m755 "${srcdir}/steamcmd.sh" "${pkgdir}/usr/share/steamcmd/steamcmd.sh"

  # in linux32 folder
  install -D -m755 "${srcdir}/linux32/crashhandler.so" "${pkgdir}/usr/share/steamcmd/linux32/crashhandler.so"
  install -D -m755 "${srcdir}/linux32/libstdc++.so.6" "${pkgdir}/usr/share/steamcmd/linux32/libstdc++.so.6"
  install -D -m755 "${srcdir}/linux32/steamcmd" "${pkgdir}/usr/share/steamcmd/linux32/steamcmd"
  install -D -m755 "${srcdir}/linux32/steamerrorreporter" "${pkgdir}/usr/share/steamcmd/linux32/steamerrorreporter"
}
