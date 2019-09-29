# Maintainer: Finn Lis <finn.lis@outlook.com>
pkgname=arizona
pkgver=0.12
pkgrel=1
pkgdesc="Fast and lightweight audio streaming client for Icecast internet radios"
arch=('i686' 'x86_64')
url="https://github.com/tlpr/arizona"
license=('GPL')
depends=('mariadb-clients' 'libshout' 'json-c')
makedepends=('pkgconf' 'make' 'clang')
_hash="318412592ed93243670db87acd3ed549afe45b25"
source=("$pkgname-$pkgver.zip::https://github.com/tlpr/arizona/archive/318412592ed93243670db87acd3ed549afe45b25.zip")

build() {
	cd "$pkgname-$_hash/src"
	make
}

package() {
	mkdir -p "$pkgdir/usr/local/bin"
	mkdir -p "$pkgdir/etc"
	cd "$srcdir/$pkgname-$_hash/src"
	make DESTDIR="$pkgdir/usr/local/bin" CONFDIR="$pkgdir/etc" install
}

md5sums=('0891baaa5892c48b3beeeabeb295051e')

