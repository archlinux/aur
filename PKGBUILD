# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.14.0
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
depends=('jlink-software-and-documentation')
source=('https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip')
sha256sums=('75e68b6f9f2f97d4ef3a208353d3b6d5acc3079f8d13a00e60f8021434608b23')

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
