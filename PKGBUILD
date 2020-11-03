# Maintainer: Konrad Mohrfeldt <konrad.mohrfeldt at farbdev dot org>

pkgname=postgresql-orafce
pkgver=3.13.4
_pkgver_name="VERSION_$(echo "$pkgver" | sed 's/\./_/g')"
_pkgver_srcdir="orafce-$_pkgver_name"
pkgrel=1
pkgdesc="Oracle Database functions in PostgreSQL"
arch=('x86_64')
url="https://github.com/orafce/orafce"
license=('0BSD')
depends=('postgresql')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orafce/orafce/archive/$_pkgver_name.tar.gz")
sha256sums=('52274fba50913dc157145ffa18ef8db5295476e8b7f40809d3c35eb22ca0ec40')

build() {
	cd "$_pkgver_srcdir"
	make
}

package() {
	cd "$_pkgver_srcdir"
	make install DESTDIR="$pkgdir"
}
