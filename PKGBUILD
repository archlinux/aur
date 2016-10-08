# Maintainer: Michal Koutenský <koutak.m@gmail.com>
pkgname=libucw
pkgver=6.5
pkgrel=1
epoch=
pkgdesc="A general purpose C library"
arch=('i686' 'x86_64')
url="http://www.ucw.cz/libucw/"
license=('LGPL')
groups=()
depends=('perl')
makedepends=('gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/download/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('f4614565e1966007bd99b81c0124284a')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure PREFIX=/usr INSTALL_SBIN_DIR=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
