# Maintainer: Flaviu Tamas <aur@flaviutamas.com>

pkgname=fswatch
pkgver=1.9.2
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"
arch=("i686" "x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
depends=()
makedepends=()
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e8bcb9018831c353cd85a8ce5fcc427e27bdff8bfc3cace1619f6cda3527d111')

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
