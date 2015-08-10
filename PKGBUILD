# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=0.9
pkgrel=1
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm')
source=("https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha256sums=('e78a56d1222c8a45f08f09409f178ddda83461085b012e5ba54b716e6c8dd61d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/sbin/bin/" Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
