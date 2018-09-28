# Maintainer: Andrew Rabert <arabert@nullsum.net>
# Contributor: Flaviu Tamas <aur@flaviutamas.com>

pkgname=fswatch
pkgver=1.13.0
pkgrel=1
pkgdesc="A cross-platform file change monitor with multiple backends: Apple OS X File System Events API, *BSD kqueue, Linux inotify, Microsoft Windows and a stat-based backend"
arch=("i686" "x86_64")
url="https://emcrisostomo.github.io/fswatch/"
license=('GPLv3')
depends=()
makedepends=()
source=("https://github.com/emcrisostomo/fswatch/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('90bcf0e02fa586251aa3233cb805ca4087e81de2c5960150a0676cc42f8534bb')

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
