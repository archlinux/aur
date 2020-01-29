# Maintainer: Timmy Yao <timmy.yao@outlook.com.au>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=gprojector
pkgver=2.4.2
pkgrel=1
pkgdesc="Transforms an equirectangular map image into many global and regional map projections"
arch=('any')
url="http://www.giss.nasa.gov/tools/gprojector/"
license=('unknown')
depends=('java-runtime')
source=("https://www.giss.nasa.gov/tools/gprojector/download/G.ProjectorJ-${pkgver}.tgz"
        'gprojector')
install=${pkgname}.install
md5sums=('3857403e02a216c20992b4a0619aa7a7'
         'e59cbbefe3fe464b6fc8d11e087c7a8f')

package() {
	install -m 755 -d "$pkgdir/opt"
	cp -r $srcdir/G.ProjectorJ "$pkgdir/opt/gprojector"

	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 $srcdir/gprojector "$pkgdir/usr/bin/gprojector"
}
