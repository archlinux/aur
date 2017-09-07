# Maintainer: Patrice Lacouture <archlinux@lacouture.org>
pkgname=gplanarity-svn
pkgver=r19609
pkgrel=1
pkgdesc="A simple puzzle game involving untangling planar graphs for fun and prizes"
arch=('i686' 'x86_64')
url="http://web.mit.edu/xiphmont/Public/gPlanarity.html"
license=('GPL2')
depends=('libxrender' 'x-server' 'freetype2' 'fontconfig')
makedepends=('subversion')
source=('svn+https://svn.xiph.org/trunk/planarity')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/planarity"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "$srcdir/planarity"
        ./touch-version
}

build() {
	cd "$srcdir/planarity"
	make
}

package() {
	cd "$srcdir/planarity"
	make PREFIX="$pkgdir/usr/local" install
}
