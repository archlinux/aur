# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=linux-minidisc
pkgver=0.9.16
pkgrel=2
pkgdesc='Free software for accessing MiniDisc devices'
arch=('i686' 'x86_64' 'armv7h')
url='https://wiki.physik.fu-berlin.de/linux-minidisc/doku.php'
makedepends=('qt5-tools')
depends=('qt5-base' 'glib2' 'libgcrypt' 'libmad' 'sox' 'libid3tag' 'libusb' 'taglib')
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://github.com/glaubitz/$pkgname/archive/$pkgver.tar.gz)
md5sums=('e4a2a35494220e4f5df6bba28b0b1aaa')

build() {
	cd $pkgname-$pkgver
	qmake-qt5 -r
	make -j1
}

package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT="$pkgdir" install
}
