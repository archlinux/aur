# Maintainer: Ryotaro Ko <aur@p1kachu.net>

pkgname=aribb24
pkgver=1.0.3
pkgrel=1
pkgdesc="A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream."
arch=('i686' 'x86_64')
url="https://github.com/nkoriyama/aribb24"
license=('LGPL3')
depends=("libpng")
makedepends=("pkg-config" "autoconf" "automake")

source=("https://github.com/nkoriyama/$pkgname/archive/v$pkgver.tar.gz")

md5sums=("5ef0a6d1d72f294666ee1489b7ebb8c5")


build() {
	cd "$pkgname-$pkgver"
    ./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
