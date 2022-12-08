# Maintainer: BossCode45
pkgname='pathfind-screensaver'
pkgver=1.0
pkgrel=1
pkgdesc='Small terminal application that makes a maze then solves it'
arch=('any')
url='https://github.com/BossCode45/pathfind'
license=('GPL3')
depends=()
source=("https://github.com/BossCode45/Pathfind/archive/refs/tags/pathfind-v$pkgver.tar.gz")
sha256sums=('2458aea5ea467dc98e56695740fce53254328d84926c22cc502a40260442e3a7')

build() {
	cd "Pathfind-pathfind-v$pkgver"
	make
}
package() {
	cd "Pathfind-pathfind-v$pkgver"
	mkdir -p "$pkgdir/usr/local/bin"
	make DESTDIR="$pkgdir/usr/local/bin" install
}
