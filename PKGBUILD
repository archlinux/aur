# Maintainer: Timmy Yao <timmy.yao@outlook.com.au>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=gprojector
pkgver=2.3.4
pkgrel=1
pkgdesc="Transforms an equirectangular map image into many global and regional map projections"
arch=('any')
url="http://www.giss.nasa.gov/tools/gprojector/"
license=('unknown')
depends=('java-runtime')
source=("https://www.giss.nasa.gov/tools/gprojector/download/G.ProjectorJ-${pkgver}.tgz"
        'gprojector')
install=${pkgname}.install
sha512sums=('ee3223880614f4b032b619a9f3b90404a6aecec7a92c0fd075b297406514a328f77a6170383a4b613560b168f77f29b4733b0bb4d0b24d62855ab18cc5a6eeea'
            '43055c0d8e6b0685d9bb3f0f31c282bfa6790d60ef27b436b974f93ff3c90a2302a7225aff0b8dbee863ba0c610dca5cc045b0044085dedbe8d139708807a5fd')

package() {
	install -m 755 -d "$pkgdir/opt"
	cp -r $srcdir/G.ProjectorJ "$pkgdir/opt/gprojector"

	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 $srcdir/gprojector "$pkgdir/usr/bin/gprojector"
}
