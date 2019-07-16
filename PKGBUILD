# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-pacman
pkgver=1.0
pkgrel=4
pkgdesc="A pacman config for pak"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('pacman')
provides=('pak-config' 'pacwrap')
source=("https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/pacwrap/pacwrap.swift" "https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/pacwrap/pak.cfg")
md5sums=('SKIP' 'SKIP')
conflicts=('pak-config-yay')

build() {
	swiftc pacwrap.swift
}

package() {
	mkdir -p $pkgdir/etc/
	mkdir -p $pkgdir/usr/bin/
	install -Dm755 pacwrap $pkgdir/usr/bin
	install -Dm644 pak.cfg /etc
}
