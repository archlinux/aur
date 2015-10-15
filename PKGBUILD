# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

pkgname=steamcmd
pkgver=latest
pkgrel=2
pkgdesc="Steam Command Line Tools"
arch=('i686' 'x86_64')
license=('custom')
url=http://developer.valvesoftware.com/wiki/SteamCMD
source=(http://media.steampowered.com/installer/steamcmd_linux.tar.gz steamcmd)
md5sums=('09e3f75c1ab5a501945c8c8b10c7f50e'
         '698e6f1f8a4b6644136c4294b5b40759')
install='steamcmd.install'
depends_x86_64=('lib32-gcc-libs')

package() {
  # sh script
  install -D -m755 "${srcdir}/steamcmd" "${pkgdir}/usr/bin/steamcmd"

  # in base folder
  install -D -m755 "${srcdir}/steam.sh" "${pkgdir}/usr/share/steamcmd/steam.sh"
  install -D -m755 "${srcdir}/steamcmd.sh" "${pkgdir}/usr/share/steamcmd/steamcmd.sh"

  # in linux32 folder
  install -D -m755 "${srcdir}/linux32/libstdc++.so.6" "${pkgdir}/usr/share/steamcmd/linux32/libstdc++.so.6"
  install -D -m755 "${srcdir}/linux32/steamcmd" "${pkgdir}/usr/share/steamcmd/linux32/steamcmd"
}
