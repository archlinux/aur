# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-redis
_project=gawkextlib
pkgver=1.7.8
pkgrel=1
pkgdesc="GAWK extension - interface to Redis via hiredis API"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('hiredis')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('e9c253d5856d42b5797103bc01f9d70a')
sha256sums=('1c462f2630f62bbfc14f3248358abd7d7646b964e5514473a1059f69b1f11109')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
