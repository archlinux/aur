# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-errno
_project=gawkextlib
pkgver=1.1.1
pkgrel=1
pkgdesc="GAWK extension - convert errno values to strings and vice versa"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('glibc')
makedepends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('503ade34970a4d687b6cc00ea79ac045')
sha256sums=('95851395247868ebd8d2f934f160b57753ef28fdd4a547b4665166f4325675c4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-silent-rules
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
