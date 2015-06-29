# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >


pkgname=racer-nocg
pkgver=0.8.44
pkgrel=1
pkgdesc='Highly realistic 3D car simulator using OpenGL, non-CG version (for older video cards)'
arch=('i686' 'x86_64')
license=(custom)
url='http://racer.nl/'
depends=('wine')
optdepends=('racer-nocg-cars: Additional cars for Racer (Non-CG version)')
source=(http://www.tracciontrasera.net/descargas/racer/beta/racer0.8.44.7z racer-nocg)
md5sums=('39c723641e1a01ede76ecd4d92d3c4b2' 'b4a71622033a9b9bddd2a80e76319bfb')

package(){
	install -d -m755 "$pkgdir/usr/bin"
	install -d -m755 "$pkgdir/opt"
	rm -r "$srcdir/racer/max"
	rm "$srcdir/racer/racer.pdb"
	rm "$srcdir/racer/tracked.pdb"
	cp -dr "$srcdir/racer" "$pkgdir/opt/racer-nocg"
	install -m 755 "$srcdir/racer-nocg" "$pkgdir/usr/bin/racer-nocg"
}
