# Maintainer: Fran Casas <nflamel@gmail.com>
pkgname=timelimit
pkgver=1.8.1
pkgrel=1
pkgdesc="Limit a process's absolute execution time"
arch=('x86_64')
url="https://devel.ringlet.net/files/sys/timelimit/timelimit-1.8.1.tar.gz"
license=('unknown')
source=("https://devel.ringlet.net/files/sys/timelimit/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('cf73e8cf874a01a3e403ed430bdff9fa')

build() {
	cd "$pkgname-$pkgver"
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
