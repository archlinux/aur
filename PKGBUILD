# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=gprojector
pkgver=1.8
pkgrel=1
pkgdesc="Transforms an equirectangular map image into many global and regional map projections"
arch=('any')
url="http://www.giss.nasa.gov/tools/gprojector/"
license=('unknown')
depends=('java-runtime')
source=('http://www.giss.nasa.gov/tools/gprojector/G.ProjectorJ-'$pkgver'.tgz'
        'gprojector')
install=${pkgname}.install
sha512sums=('9796bd33e209aeb7b973cdadc47fa18dfcbb1d48d9544b9aadb0d4cf1e06e5d8f7e1542f26fb89b9691547845b2433280f0dc5710c0f68a470a9ef2c9101acb8'
            '43055c0d8e6b0685d9bb3f0f31c282bfa6790d60ef27b436b974f93ff3c90a2302a7225aff0b8dbee863ba0c610dca5cc045b0044085dedbe8d139708807a5fd')

package() {
	install -m 755 -d "$pkgdir/opt"
	cp -r $srcdir/G.ProjectorJ "$pkgdir/opt/gprojector"

	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 $srcdir/gprojector "$pkgdir/usr/bin/gprojector"
}
