# Maintainer: Jens Rudolf <jens.rudolf@gmx.net>
pkgname=linuxband
pkgver=12.02.1
pkgrel=1
pkgdesc="A GUI front-end for MMA - Musical MIDI Accompaniment"
arch=(x86_64)
url="http://linuxband.org"
license=('GPL')
depends=('libsmf>=1.3'
		 'mma'
		 'jack'
		 'python2>=2.5'
		 'python2-gtksourceview2'
		 'gtksourceview2'
		 'pygtk')

source=("http://linuxband.org/assets/sources/$pkgname-$pkgver.tar.gz")
md5sums=('d87c8db9badf776fd321362b2fdb6c7a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
