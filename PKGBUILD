# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl-beta
pkgver=2.5.0_beta3
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
conflicts=('icesl')
provides=('icesl')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=("https://icesl.loria.fr/assets/other/download.php?build=${pkgver//_/-}&version=beta&os=amd64")
sha512sums=('045a6f190422383e0f8418a940bffd9f19e2af6b936febe0a57a99236a7c35d21fb85c9657baf36812479c5ff58975c5c8cd79c8565285eb849ec5d7bd1fc9b8')

package() {
	mkdir -p $pkgdir/usr/{,bin,share{,/licenses}/${pkgname%-beta}}
	cp -a $srcdir/${pkgname%-beta}/ $pkgdir/usr/share/
	ln -s /usr/share/${pkgname%-beta}/copyright $pkgdir/usr/share/licenses/${pkgname%-beta}/LICENSE
	ln -s /usr/share/${pkgname%-beta}/bin/IceSL-slicer $pkgdir/usr/bin/${pkgname%-beta}
}
