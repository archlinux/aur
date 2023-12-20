# Maintainer: Sainan <sainan@calamity.gg>
pkgname=plutolang
pkgver=0.7.4
pkgrel=1
arch=('x86_64')
source=("pluto-git::git+https://github.com/PlutoLang/Pluto#tag=$pkgver")
sha256sums=('SKIP')

build () {
	cd pluto-git
	cd src
	make -j PLAT=linux
}

package () {
	cd $srcdir/pluto-git
	mkdir -p $pkgdir/usr/local/bin
	cp src/pluto $pkgdir/usr/local/bin/pluto
	cp src/plutoc $pkgdir/usr/local/bin/plutoc
}
