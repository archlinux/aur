# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.14.2
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
depends=('jlink-software-and-documentation')
source=("$pkgname-$pkgver.zip::https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip")
sha256sums=('78913c3cb61615ccc8a1d1753d74a859d959f66f88eda78604207dd303b7e551')

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
