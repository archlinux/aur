# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=kodi-setwakeup
pkgver=1.0.1
pkgrel=1
pkgdesc="Helper binary to call kodi setwakeup.sh with root privileges"
url="https://github.com/VDR4Arch/vdr4arch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('kodi-standalone-service')
makedepends=()
source=('kodi-setwakeup.c'
        'setwakeup.sh')
md5sums=('45e179324952f5aba8980e8dad7e91be'
         '333278349fb355c01323f42b8105f333')

build() {
  gcc -o kodi-setwakeup kodi-setwakeup.c
}

package() {
  install -Dm754 kodi-setwakeup "$pkgdir/usr/bin/kodi-setwakeup"
  chgrp 420 "$pkgdir/usr/bin/kodi-setwakeup"
  chmod u+s "$pkgdir/usr/bin/kodi-setwakeup"

  install -Dm755 setwakeup.sh "$pkgdir/usr/lib/kodi/bin/setwakeup.sh"
}
