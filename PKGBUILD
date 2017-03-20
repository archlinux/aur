# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: Amadeusz Żołnowski

pkgname=plymouth-openrc-plugin
pkgver=0.1.2
pkgrel=2
pkgdesc="Plymouth plugin for OpenRC "
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/Megver83/plymouth-openrc-plugin"
license=('GPL2')
source=("git+https://github.com/Megver83/plymouth-openrc-plugin.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	mkdir -p $pkgdir/usr/lib/rc/plugins
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
