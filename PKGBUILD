# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=diskscan
pkgver=0.20
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python-yaml')
makedepends=('cmake')
install=
source=("https://github.com/baruch/$pkgname/archive/$pkgver.tar.gz")

sha256sums=('86038b3eb45fd4b2485a4ffba1949c68bea66f13a4c991265e3d527f022ed966')
#sha256sums=(SKIP)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
#	mkdir -p "$pkgdir/usr/bin"
#	mkdir -p "$pkgdir/usr/share/man/man1"

	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
