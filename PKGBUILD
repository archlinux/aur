# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-abort
_project=gawkextlib
pkgver=1.0.1
pkgrel=1
pkgdesc="GAWK extension - implements the abort API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
makedepends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('6b5a723a98b76c0197e026aab68534eb')
sha256sums=('61a007421159607131d0b7d730948b696db2d03694bac40eb54265a5c9c023b5')

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
