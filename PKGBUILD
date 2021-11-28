# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.4.2
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="https://icesl.loria.fr"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl' 'glfw')
source=("https://icesl.loria.fr/assets/packages/linux/amd64/IceSL_amd64.zip")
sha512sums=('23f15cbc6e27a47387259ecf50c7d58b4c4465c34e7328902a7d97f9ffe12854ccaf06aa200c97b50adaf1d7c41a0d256ebc3b8654ad6c4d4582476262ca3c1b')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/$pkgname}
	cp -a $srcdir/$pkgname/ $pkgdir/usr/share/
	ln -s /usr/share/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
