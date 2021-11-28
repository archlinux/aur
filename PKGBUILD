# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl-beta
pkgver=2.4.2_beta1
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
conflicts=('icesl')
provides=('icesl')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=('https://icesl.loria.fr/assets/packages/linux/beta/IceSL_beta.zip')
sha512sums=('57fbb9c3c28ac13c8ba0d665ee7169973f3ebf0037eeb3cf2f96dbdef38cbd858b4a5de1ab675f3cb98c69361273b2ef32e2bc1d02055484114f3286c4bad60e')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/${pkgname%-beta}}
	cp -a $srcdir/${pkgname%-beta}/ $pkgdir/usr/share/
	ln -s /usr/share/${pkgname%-beta}/copyright $pkgdir/usr/share/licenses/${pkgname%-beta}/LICENSE
	ln -s /usr/share/${pkgname%-beta}/bin/IceSL-slicer $pkgdir/usr/bin/${pkgname%-beta}
}
