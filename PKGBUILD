# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=tpc-git
pkgver=0.44rc2plus
pkgrel=1
pkgdesc="For AMD processors. It can manipulate power states, frequencies, DRAM timings, power settings and can report temperatures, monitor pstate changes and precise cpu usage.
Currently supported families are: 10h, 11h, 12h, 14h, 15h"
arch=(i686 x86_64)
url="https://code.google.com/p/turionpowercontrol/"
license=('GPLv2')
depends=('gcc-libs' 'ncurses')
source=(https://github.com/mh0rst/turionpowercontrol/archive/master.zip)
md5sums=('SKIP')

build() {

  cd "${srcdir}"/turionpowercontrol-master

  make

}

package() {

  install -Dm755 "${srcdir}"/turionpowercontrol-master/TurionPowerControl "${pkgdir}"/usr/bin/tpc
  install -Dm644 "${srcdir}"/../tpc.conf "${pkgdir}"/etc/modules-load.d/tpc.conf 
}
