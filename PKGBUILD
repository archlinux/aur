# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.13.1
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
source=('https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip')
sha256sums=('bcd69eb9b3aea533f9ee1bc50948fa3b2e03a263d2d8234818a9842d45b391f0')

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
