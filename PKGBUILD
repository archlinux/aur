# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.10.3
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
source=('https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip')
sha256sums=('1e9b0a46dbcec622d507a01632efa475aebe9b15641700c7ecd47bc9d1a7d43e')

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
