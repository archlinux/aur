# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl-beta
pkgver=2.3.4
_id=38248
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
conflicts=('icesl')
provides=('icesl')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=("https://gforge.inria.fr/frs/download.php/file/${_id}/${pkgname}-${pkgver//_/-}-amd64.zip")
sha512sums=('b716880e56c30689f350af613f50dc7d2327f05b3accdf3615f6863b77a98b3084226a36e3c10cf1db5c39508c059bd1a804ed9bf22194ed2bf799e8ae7f25a0')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/${pkgname%-beta}}
	cp -a $srcdir/${pkgname%-beta}/ $pkgdir/usr/share/
	ln -s /usr/share/${pkgname%-beta}/copyright $pkgdir/usr/share/licenses/${pkgname%-beta}/LICENSE
	ln -s /usr/share/${pkgname%-beta}/bin/IceSL-slicer $pkgdir/usr/bin/${pkgname%-beta}
}
