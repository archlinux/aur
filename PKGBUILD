# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl-beta
pkgver=2.3_beta1
_id=37757
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
conflicts=('icesl')
provides=('icesl')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=("https://gforge.inria.fr/frs/download.php/file/${_id}/${pkgname}-${pkgver//_/-}-amd64.zip")
sha512sums=('df075ceb6164220e967050babd3b17d6107b7b766bcd79e5a2d92e26a45d6d03742b04ce7fc5a3dfb22f984436296b711db77f6c765ec0be9d8e6031550572e1')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/${pkgname%-beta}}
	cp -a $srcdir/${pkgname%-beta}/ $pkgdir/usr/share/
	ln -s /usr/share/${pkgname%-beta}/copyright $pkgdir/usr/share/licenses/${pkgname%-beta}/LICENSE
	ln -s /usr/share/${pkgname%-beta}/bin/IceSL-slicer $pkgdir/usr/bin/${pkgname%-beta}
}
