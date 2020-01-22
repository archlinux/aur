# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-yay-git
pkgver=1.0
pkgrel=5
pkgdesc="A pacman config for yay"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('yay' 'pak' 'swift-language')
provides=('pak-config' 'yaywrap')
source=('https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/yaywrap/yaywrap.swift' 'https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/yaywrap/pak.cfg')
md5sums=('SKIP' 'SKIP')
conflicts=('pak-config-pacman')

build() {
	swiftc yaywrap.swift
}

package() {
	install -Dm755 yaywrap $pkgdir/usr/bin
	install -Dm644 pak.cfg $pkgdir/etc
}
