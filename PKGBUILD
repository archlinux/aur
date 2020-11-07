# Maintainer: lesto <lestofante88@gmail.com>

pkgname=pacman-parallelizer
pkgver=10
pkgrel=1
pkgdesc="A minimal package downloader for pacman, using aria2"
arch=(any)
url="https://github.com/lestofante/PacmanParallelizer"
urlgit="https://github.com/lestofante/PacmanParallelizer.git"
license=('GPL3')
depends=('aria2' 'pacman-contrib')
source=("$pkgname-$pkgver"::"git+$urlgit#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	chmod +x ./pp.sh
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp pp.sh "$pkgdir/usr/bin"
}
