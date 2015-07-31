# Maintainer: Artur Kowalski <arturdeb@gmail.com>
pkgname=digital-clock
pkgver=1.0.0
pkgrel=1
pkgdesc="This application is a small clock widget for Linux desktop."
arch=('i686' 'x86_64')
licence=('LGPL')
depends=('qt5-base>=5.4')
optdepends=('git')

build() {
	git clone https://github.com/Oficerx/Digital-clock.git
	cd $srcdir/Digital-clock

	qmake -o Makefile digital_clock.pro
	make
}

package() {	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/Digital-clock/digital_clock $pkgdir/usr/bin/dclock
}
