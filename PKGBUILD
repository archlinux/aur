# Maintainer: Andrew Rabert <arabert@nullsum.net>
# Contributor: Flaviu Tamas <aur@flaviutamas.com>

pkgname=fswatch
pkgver=1.12.0
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"
arch=("i686" "x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
depends=()
makedepends=()
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8042da283b34dc383ff6321254163e378d4f3cd5d8df87ff608f811ea33e6a83')

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
