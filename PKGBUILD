# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.3.1
_id=37841
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=("https://gforge.inria.fr/frs/download.php/file/${_id}/${pkgname}-${pkgver}-amd64.zip")
sha512sums=('55cc173446e37cdc736c83bfc231ed2e29b27c389d08bb8dcc8b9d17591a2fab738078d48c8041604c672617d13d5536b1ae9b39caac008357653a277e7bc5fd')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/$pkgname}
	cp -a $srcdir/$pkgname/ $pkgdir/usr/share/
	ln -s /usr/share/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
