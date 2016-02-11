# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=tpc-git
pkgver=0.44rc2plus
pkgrel=1
pkgdesc="For AMD processors. It can manipulate power states, frequencies, DRAM timings, power settings and can report temperatures, monitor pstate changes and precise cpu usage.
Currently supported families are: 10h, 11h, 12h, 14h, 15h"
arch=(i686 x86_64)
url="https://github.com/turionpowercontrol/tpc"
license=('GPLv2')
depends=('gcc-libs' 'ncurses')
source=(https://github.com/turionpowercontrol/tpc/archive/master.zip)
md5sums=(765101c002be892d64caa23b905b07de)

build() {

  cd "${srcdir}"/tpc-master

  make

}

package() {

	install -Dm755 "${srcdir}"/tpc-master/TurionPowerControl "${pkgdir}"/usr/bin/tpc
	mkdir "${pkgdir}"/etc/
	mkdir "${pkgdir}"/etc/modprobe.d
	touch "${pkgdir}"/etc/modprobe.d/tpc.conf
	echo "cpuid" > "${pkgdir}"/etc/modprobe.d/tpc.conf
	echo "msr" >> "${pkgdir}"/etc/modprobe.d/tpc.conf
}
