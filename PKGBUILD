# Maintainer: Scott Lawrence <bytbox@gmail.com>
# Contributor: Scott Smith <jcdenton513@gmail.com>
# Contributor: tuxce <tuxce.net@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=xbelld
pkgver=0.3.3
pkgrel=4
pkgdesc="X daemon that performs an action every time the bell is rung"
url="http://code.google.com/p/xbelld/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('xorg-server' 'pkgconfig' 'alsa-lib')
source=(http://xbelld.googlecode.com/files/xbelld-${pkgver}.tbz2)
md5sums=('d6c9b96ac5ccd4a3072e4c9e7add6547')

build() {
	cd $startdir/src/$pkgname-$pkgver
	LDFLAGS=-lm make || return 1
}

package() {
	cd $startdir/src/$pkgname-$pkgver
	install -m755 -D xbelld ${pkgdir}/usr/bin/xbelld
	install -m644 -D xbelld.1 ${pkgdir}/usr/share/man/man1/xbelld.1
}


