# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=tpasm
pkgver=1.8
pkgrel=2
pkgdesc="A cross assembler for 6805, 6809, 68HC11, 6502, Sunplus, 8051, Z80, PIC, AVR and c166"
arch=('i686' 'x86_64')
url="http://www.sqrt.com/"
license=('GPL')
depends=(gcc-libs)
options=('strip' '!emptydirs')
source=(http://www.sqrt.com/downloads/tpasm.tgz)
md5sums=('ce58fc2a66ba7712fab7318383ed8c91')

build() {
	cd "$srcdir/$pkgname$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname$pkgver"
	install -Dm 755 tpasm $pkgdir/usr/bin/tpasm
	
	mkdir -p $pkgdir/usr/share/doc/$pkgname-$pkgver/samples
	install -m 644 *.TXT $pkgdir/usr/share/doc/$pkgname-$pkgver
	install -m 644 samples/* $pkgdir/usr/share/doc/$pkgname-$pkgver/samples
}
