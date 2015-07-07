# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Edward Tj?rnhammar <xhemi@cube2.se>
# Contributor: Ariel Popper <a@arielp.com>

pkgname=sixpair
pkgver=1.8
pkgrel=4
pkgdesc="Associate PS3 Sixaxis controller to system bluetoothd via USB"
arch=('i686' 'x86_64')
url="http://www.pabr.org/sixlinux/"
license=('GPL')
depends=('libusb' 'libusb-compat' 'libx11' 'glibc' 'bluez-utils')
source=(http://www.pabr.org/sixlinux/sixpair.c 
        http://www.pabr.org/sixlinux/sixhidtest.c 
        http://www.pabr.org/sixlinux/xsixhidtest.c)
md5sums=('0a9f03cd08f1483341f60c9b7cf5204c'
         '8298412801178255d3bf84f4ead0306d'
         '6fc492ddf084827b5876871dfa5fa3a6')

build(){
	cd "$srcdir"
	gcc -o sixpair sixpair.c -lusb
	gcc -o sixhidtest sixhidtest.c
	gcc -o xsixhidtest xsixhidtest.c -lX11 -lm
}

package(){
	cd "$srcdir"
	install -Dm0755 sixpair "$pkgdir/usr/bin/sixpair"
	install -m0755 sixhidtest "$pkgdir/usr/bin/sixhidtest"
	install -m0755 xsixhidtest "$pkgdir/usr/bin/xsixhidtest"
}

