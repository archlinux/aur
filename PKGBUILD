# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=dated
pkgver=1.0.1
pkgrel=1
pkgdesc='Add a timestamp to every line of a stream'
arch=('x86_64')
url=https://github.com/sjmulder/$pkgname
license=(AGPL3)
depends=(glibc)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(10d345e2f731769b77a6427810ebfe0120a67be4194c36743fbae8fb5b488889)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	ls | ./dated >/dev/null
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man
}
