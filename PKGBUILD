# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname=sublime-docs
pkgdesc="local copy of the sublime text & sublime merge html docs"
pkgver=0
pkgrel=0
arch=(any)
url=https://www.sublimemerge.com/docs/
url=https://www.sublimetext.com/docs/
license=()
makedepends=(curl sed sh grep)
source=(subldoc.sh)
sha512sums=(02dbfeb7e0bad84ab824aebd396d0739f63888be04eb02821a7a8d9fe394d02721ae8d3434fe8a4066e34b0d6cec5e040fa6a525039b919b7b9def76701082ba)

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
