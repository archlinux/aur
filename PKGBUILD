# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=ped
pkgver=0.0.3
pkgrel=4
pkgdesc="Ped is a vim-like editor built with ncurses."
arch=('x86_64')
url="https://github.com/tim-tm/ped"
license=('MIT')
depends=('glibc' 'ncurses')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver::https://github.com/tim-tm/ped/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f137f1fe075a25cf50e763355e43bcc359f531bdb9314ae18c0de4b8dea6f89bb58cd3e72eb898aa69ffbca4c6f85071b6a8efdfb9977c823028f8bc33b4723a')

build() {
	cd "$pkgname-$pkgver"
    ./configure
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
