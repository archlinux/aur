# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >


pkgname=racer-cg
pkgver=0.8.44
pkgrel=1
pkgdesc='Highly realistic 3D car simulator using OpenGL, CG version (for newer video cards)'
arch=('i686' 'x86_64')
license=(custom)
url='http://racer.nl/'
depends=('wine')
optdepends=('racer-cg-cars: Additional cars for Racer (CG version)')
source=(http://www.tracciontrasera.net/descargas/racer/beta/racer0.8.44.7z racer-cg)
md5sums=('39c723641e1a01ede76ecd4d92d3c4b2' 'c978a5d34c6b52e1f8d67cd637761d13')

package(){
	install -d -m755 "$pkgdir/usr/bin"
	install -d -m755 "$pkgdir/opt"
	rm -r "$srcdir/racer/max"
	rm "$srcdir/racer/racer.pdb"
	rm "$srcdir/racer/tracked.pdb"
	cp -dr "$srcdir/racer" "$pkgdir/opt/racer-cg"
	install -m 755 "$srcdir/racer-cg" "$pkgdir/usr/bin/racer-cg"
}
