# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=diskscan
pkgver=0.18
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python-yaml')
makedepends=('cmake')
install=
source=("https://codeload.github.com/baruch/$pkgname/tar.gz/$pkgver")

sha256sums=('af65400c3dc97c09434e885458684fc9fadcd327575f733c2dd657e94ff2e406')
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
