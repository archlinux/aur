# Maintainer: Miguel Barrio Orsikowsky <megamik79@protonmail.com>

pkgname=pzxtools
pkgver=1.1
pkgrel=4
pkgdesc="A set of programs for manipulating PZX files, a tape file format designed primarily for archiving content of Sinclair ZX Spectrum tapes"
arch=('x86_64')
url="http://zxds.raxoft.cz/pzx.html"
license=('custom:Copyright (c) 2007 Patrik Rak')

source=("http://zxds.raxoft.cz/pzx/${pkgname}_${pkgver//.}_src.zip")
sha256sums=('f50cf5804c080be97d37863cc331f63fe1657b102fc446461ac8bc06e07485a0')

build() {
	cd "$srcdir/src"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install "$srcdir/src/pzx2txt" -t "$pkgdir/usr/bin/"
	install "$srcdir/src/pzx2wav" -t "$pkgdir/usr/bin/"
	install "$srcdir/src/tap2pzx" -t "$pkgdir/usr/bin/"
	install "$srcdir/src/txt2pzx" -t "$pkgdir/usr/bin/"
	install "$srcdir/src/tzx2pzx" -t "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -r "$srcdir/"{docs,scripts,changes.txt,license.txt,readme.txt} "$pkgdir/usr/share/doc/$pkgname/"
}
