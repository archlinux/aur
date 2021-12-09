# Maintainer: Yassen Efremov <yassen.games@gmail.com>
pkgname=scrabble-1d
pkgver=1.0.1
pkgrel=2
pkgdesc="A one-dimensional scrabble-like console game."
arch=(x86_64)
url="https://github.com/YassenEfremov/scrabble-1d.git"
license=('GPL')
depends=('glib2' 'json-glib' 'ncurses')
makedepends=(git make automake)
optdepends=()
provides=(scrabble-1d)
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
