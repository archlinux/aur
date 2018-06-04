# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl-beta
pkgver=2.2_beta8
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
conflicts=('icesl')
provides=('icesl')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=(https://gforge.inria.fr/frs/download.php/file/37546/${pkgname}${pkgver}-amd64.zip)
sha512sums=('d7a8d73cbd377765aaaccdd9faac12a3e79f0cd2020b89c0e010ec622e2a7b29e0516369643df11f7f204c17d17278a96002bacb0f1420f5fd27762a36f464b2')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/${pkgname%-beta}}
	cp -a $srcdir/${pkgname%-beta}/ $pkgdir/usr/share/
	ln -s /usr/share/${pkgname%-beta}/copyright $pkgdir/usr/share/licenses/${pkgname%-beta}/LICENSE
	ln -s /usr/share/${pkgname%-beta}/bin/IceSL-slicer $pkgdir/usr/bin/${pkgname%-beta}
}
