# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.4.4
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="https://icesl.loria.fr"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl' 'glfw')
source=("https://icesl.loria.fr/assets/other/download.php?build=$pkgver&version=stable&os=amd64")
sha512sums=('00aa55792ae467a3a7b14c6911da86322f91b61fc2319a7b6451deb94551332908ea41fc83e42352ee3af77cee64d163f3a3815cc085deca31c33cb28101cc19')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/$pkgname}
	cp -a $srcdir/$pkgname/ $pkgdir/usr/share/
	ln -s /usr/share/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
