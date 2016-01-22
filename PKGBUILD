# Maintainer: Jan Koppe <post@jankoppe.de>
pkgname=libvisca
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="library for controlling VISCA compliant cameras through a RS232 port of your PC."
arch=('i686' 'x86_64')
url="http://damien.douxchamps.net/libvisca/"
license=('LGPL')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/libvisca/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download")
noextract=()
md5sums=('98a2ee940091dcf25c9af89e55518890')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
