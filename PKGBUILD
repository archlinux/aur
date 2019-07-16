# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-yay
pkgver=1.0
pkgrel=3
pkgdesc="A pacman config for yay"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('yay')
provides=('pak-config' 'yaywrap')
source=('https://gitlab.com/moussaelianarsen/pak/blob/master/plugins/yaywrap/yaywrap.swift' 'https://gitlab.com/moussaelianarsen/pak/blob/master/plugins/yaywrap/pak.cfg')
md5sums=('SKIP')
conflicts=('pak-config-pacman')

build() {
	swiftc yaywrap.swift
}

package() {
	mkdir -p $pkgdir/etc/
	mkdir -p $pkgdir/usr/bin/
	sudo install yaywrap $pkgdir/usr/bin
	sudo cp plugins/yaywrap/pak.cfg /etc
}
