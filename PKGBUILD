# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-pacman
pkgver=1.0
pkgrel=1
pkgdesc="A pacman config for pak"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('pak' 'pacman')
provides=('pak-config' 'pacwrap')
source=("https://gitlab.com/moussaelianarsen/pak/-/archive/master/pak-master.tar.gz")
md5sums=('SKIP')
conflicts=('pak-config-yay')

build() {
	cd "pak-master"
	make pacwrap
}

package() {
	cd "pak-master"
	mkdir -p $pkgdir/etc/
	mkdir -p $pkgdir/usr/bin/
	sudo install pacwrap $pkgdir/usr/bin
	sudo cp plugins/pacwrap/pak.cfg /etc
}
