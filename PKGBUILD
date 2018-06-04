# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.1.13
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=(https://gforge.inria.fr/frs/download.php/file/37508/${pkgname}${pkgver}-amd64.zip)
sha512sums=('1a8adc683a00242a9e26233fc91395a9885d67cbb6809bcac52ccfd8741cf95edb1842e717b7dac277c9dfddc0429e0a011c008bcac7ca5c71df78a1b1e4c8d9')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/$pkgname}
	cp -a $srcdir/$pkgname/ $pkgdir/usr/share/
	ln -s /usr/share/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
