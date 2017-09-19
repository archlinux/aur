# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-xml
_project=gawkextlib
pkgver=1.0.6
pkgrel=1
pkgdesc="GAWK extension - interface to Expat for parsing XML"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('expat' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('9f00d66370f65922052b661bf56442c1')
sha256sums=('9f49cf8857e2cca879fbe66c99d69bf267208a3c756b1f68fcfc23cc06c7b10c')

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
