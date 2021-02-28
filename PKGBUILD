# Maintainer: tPenguinLTG <tpenguinltg at disroot dot org>
pkgname=se
pkgver=3.0.1
pkgrel=1
pkgdesc="A screen oriented version of the classic UNIX text editor ed"
arch=('i686' 'x86_64')
url="http://se-editor.org/"
license=('custom:public domain')
depends=('ncurses')
source=("http://se-editor.org/dist/$pkgname-$pkgver.tar.gz")
md5sums=('1591fbb514729f846a4f12bdc45ee600')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
