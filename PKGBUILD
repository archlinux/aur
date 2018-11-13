# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=nostt
pkgver=1.1
pkgrel=1
pkgdesc='Command line NOS Teletekst reader'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(BSD)
depends=(glibc curl json-c)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(454afb4a6fc3ee31c207c310394bee2c5d2a2b1e32dc9fb5f7f5f53bf4dca9f9)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}
