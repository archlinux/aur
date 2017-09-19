# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-haru
_project=gawkextlib
pkgver=1.0.2
pkgrel=1
pkgdesc="GAWK extension - interface to the libharu PDF library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('libharu' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('a2e5a2f3dfe2a49460719e1fe485d45d')
sha256sums=('92fb8d83b71de2fe2aec0bc2468459e728290e0c675ca8c19aaf195ba3cad9b6')

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
