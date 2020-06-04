# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.10.0
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
source=('https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip')
# No versioned archives are provided so this will break on every update...
sha256sums=('01f7aaf9c3f26f8dd09e24ab87e6fe7f0bb692951261b30498bf9b011dba6476')

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
