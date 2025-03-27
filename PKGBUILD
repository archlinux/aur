# Maintainer: Rihards Skuja <rhssk at posteo dot eu>

pkgname=simplicity-commander
pkgver=1.17.5
pkgrel=1
pkgdesc='GUI and command line access to the debug features of Silicon Labs devices'
arch=('x86_64')
url='https://www.silabs.com/mcu/programming-options'
license=('LGPL')
options=('!strip')
depends=('jlink-software-and-documentation')
source=("$pkgname-$pkgver.zip::https://www.silabs.com/documents/public/software/SimplicityCommander-Linux.zip")
sha256sums=('144659c5740ad4989ad4e820829450584648692a849490b4d8b51ae776ab3982')
noextract=("$pkgname-$pkgver.zip")

prepare() {
	bsdtar -xpf "$pkgname-$pkgver.zip"
}

package() {
	cd "SimplicityCommander-Linux"
	install -d "$pkgdir"/{usr/bin,opt}
	tar -xjf Commander_linux_x86_64_*.tar.bz
	cp -a "$srcdir/SimplicityCommander-Linux/commander" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/commander" "$pkgdir/usr/bin/"
}
