# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawkextlib
_project=$pkgname
pkgver=1.0.4
pkgrel=2
pkgdesc="Library containing APIs used by various GAWK extensions"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('3beafa6ccb68522fb02f4fd16aa5c1dd')
sha256sums=('ecd06c1857f58530f73866dffb74a32f17d1194c045f351b5ab8acad4f77678c')

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
