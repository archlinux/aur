# Maintainer: Vithon <ratm@archlinux.us>
# Author: ody
# Contributor: donvla
# Contributor: wain <wain@archlinux.fr>

pkgname=pacman-cage
pkgver=2.9.8.2
pkgrel=7
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman." 
url="http://bbs.archlinux.org/viewtopic.php?id=20385" 
license=('GPL') 
arch=('any')
install=pacman-cage.install
source=(pacman-cage pacman-uncage pacmandb.rc backup_pacmandb.cron pacmandb.service)
md5sums=('8d052630a7d9e01f62df126904ab2103'
         'a61819e8d8840a0eea3f4c87aa330340'
         'e62e8dbb900ab9f996631f470149f839'
         '8b7dc8a570473667a53498eda219e65e'
         '2618f1470f28e4e16f7aba705c0f10ba')

package() { 
	cd ${srcdir}
	install -Dm755 pacman-cage ${pkgdir}/usr/bin/pacman-cage
	install -m755 pacman-uncage ${pkgdir}/usr/bin/pacman-uncage
	install -Dm755 ${srcdir}/pacmandb.rc ${pkgdir}/etc/rc.d/pacmandb

	# Choose one if you wish to install the cron backup script.
	# You also might want to change the backup dir inside the script.
	#install -Dm755 backup_pacmandb.cron ${pkgdir}/etc/cron.hourly/backup_pacmandb
	#install -Dm755 backup_pacmandb.cron ${pkgdir}/etc/cron.daily/backup_pacmandb

	# Uncomment the following line to install the systemd service file.
	#install -Dm644 pacmandb.service ${pkgdir}/lib/systemd/system/pacmandb.service
}
