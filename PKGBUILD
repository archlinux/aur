# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=diskscan
pkgver=0.21
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python-yaml')
makedepends=('cmake')
install=
source=("https://github.com/baruch/$pkgname/archive/$pkgver.tar.gz")

sha256sums=('e4d82e0c9f29435e0fffc95fe94efa8f3fafb2573b92d1cb3fb547bd3c40f693')
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
