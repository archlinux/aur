# Maintainer: David Haines <dhaines@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Scott Smith <jcdenton513@gmail.com>
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=xbelld
pkgver=0.3.3
pkgrel=6
pkgdesc="X daemon that performs an action every time the bell is rung"
url="https://gitlab.com/gi1242/xbelld"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('xorg-server' 'alsa-lib')
makedepends=('git')
source=('git+https://gitlab.com/gi1242/xbelld.git#commit=8d79553d')
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	LDFLAGS=-lm make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -m755 -D xbelld ${pkgdir}/usr/bin/xbelld
	install -m644 -D xbelld.1 ${pkgdir}/usr/share/man/man1/xbelld.1
}
