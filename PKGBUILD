# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.2.1
_id=37649
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=("https://gforge.inria.fr/frs/download.php/file/${_id}/${pkgname}-${pkgver}-amd64.zip")
sha512sums=('cecfb538f1b65bfbe2196b64194ebd833999a6ae02713142226ab6426262be33778a419624d153f4d1ad805dd487a62fec99f961ca2827a0979668b26eec308c')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/$pkgname}
	cp -a $srcdir/$pkgname/ $pkgdir/usr/share/
	ln -s /usr/share/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
