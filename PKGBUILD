# Maintainer: Cristian Baldi crisbal <bld.cris.96@gmail.com>
pkgname=byaccj
pkgver=1.15
pkgrel=1

pkgdesc="An extension of the Berkeley YACC-compatible parser generator."
url="http://byaccj.sourceforge.net/"
license=("custom: public domain")

arch=(any)
source=("https://downloads.sourceforge.net/project/byaccj/byaccj/1.15/byaccj1.15_src.tar.gz" "makefile.patch")
md5sums=("SKIP" "SKIP")


prepare() {
	cd "byaccj1.15/src"
	echo "Applying patch..."
	patch -Np0 -i "$srcdir/makefile.patch"
	echo "Patch applied..."
}

build() {
	cd "byaccj1.15/src"
	make linux
}

package() {
	cd "byaccj1.15/src"
	echo "Package will provide command: byaccj"
	install -Dm 775 yacc.linux "$pkgdir/usr/bin/byaccj"
}
