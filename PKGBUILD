# Maintainer: Daniel Strobl <danielstrobl:gmail>
pkgname=welle.io-git
pkgver=V20170826.r134.gfea3a21
pkgrel=1
pkgdesc="Open source DAB and DAB+ software defined radio"
arch=('x86_64')
url="https://github.com/AlbrechtL/welle.io"
license=('GPL')
depends=('qt5-multimedia' 'qt5-declarative' 'qt5-charts' 'fftw' 'faad2' 'rtl-sdr' 'airspy')
makedepends=('git' 'gcc')
provides=('welle.io')
conflicts=('welle.io')
source=('git://github.com/AlbrechtL/welle.io')
md5sums=('SKIP')

pkgver() {
	cd welle.io
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd welle.io
	qmake welle.io.pro
	make
}

package() {
	cd welle.io
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/applications
	mkdir $pkgdir/usr/share/pixmaps
	cp welle-io $pkgdir/usr/bin
	cp welle-io.desktop $pkgdir/usr/share/applications
	cp icon.png $pkgdir/usr/share/pixmaps/welle-io.png
}
