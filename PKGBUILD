# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname=sublime-docs
pkgdesc="local copy of the sublime text & sublime merge html docs"
pkgver=0
pkgrel=0
arch=(any)
url=https://www.sublimetext.com/docs/
url=https://www.sublimemerge.com/docs/
license=()
makedepends=(curl sed sh grep)
source=(subldoc.sh)
sha256sums=(SKIP)

build(){
	for i in sublimetext sublimemerge; do
		mkdir -p -- "$srcdir/$i"
		cd -- "$srcdir/$i"
		"$srcdir/subldoc.sh" "https://www.$i.com"
	done
}

package(){
	p="$pkgdir/usr/share/doc/"
	mkdir -p -- "$p"
	mv -- "$srcdir/sublimetext"  "$p/sublime-text"
	mv -- "$srcdir/sublimemerge" "$p/sublime-merge"
}


