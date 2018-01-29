# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.1.6
pkgrel=2
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=(https://gforge.inria.fr/frs/download.php/file/37090/${pkgname}${pkgver}-amd64.deb)
sha512sums=('620342d536c65d9d764f5cd342ef592a72451118a0de49a083daa743272c98e4341e6c9170d135410ed2afd6d4f0e52975eccf29cbcac4de1ca3fe7a9cad5521')

package() {
	bsdtar -xf control.tar.gz ./copyright
	install -Dm644 $srcdir/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	bsdtar -xf $srcdir/data.tar.xz -C $pkgdir
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
