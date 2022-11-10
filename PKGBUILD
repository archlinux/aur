# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=textseeker
pkgver=1.4.0
pkgrel=5
epoch=
pkgdesc="Simpe text search utility"
url="https://codeberg.org/dyfet/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/dyfet/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(gcc qt6-base qt6-tools)
depends=()
sha256sums=('7ea93b316687c26a4ec24217e97a96a763640869e0121f40a3b5a4ec42486a4f') 

build() {
	cd "$srcdir/$pkgname"
	qmake6 PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
	strip "$pkgdir"/usr/bin/textseeker*
}


