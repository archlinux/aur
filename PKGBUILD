# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=gprojector
pkgver=1.7.4
pkgrel=1
pkgdesc="Transforms an equirectangular map image into many global and regional map projections"
arch=('any')
url="http://www.giss.nasa.gov/tools/gprojector/"
license=('unknown')
depends=('java-runtime')
source=('http://www.giss.nasa.gov/tools/gprojector/G.ProjectorJ-'$pkgver'.tgz'
        'gprojector')
install=${pkgname}.install
sha512sums=('908567d97b84ea17fcacc33cafac2b5bbba1d260724c791de7d33cd16b876dc16e17cf652152822f2ef5a88e5eceb313afca70d8b10056fc691880788de040f6'
            '43055c0d8e6b0685d9bb3f0f31c282bfa6790d60ef27b436b974f93ff3c90a2302a7225aff0b8dbee863ba0c610dca5cc045b0044085dedbe8d139708807a5fd')

package() {
	install -m 755 -d "$pkgdir/opt"
	cp -r $srcdir/G.ProjectorJ "$pkgdir/opt/gprojector"

	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 $srcdir/gprojector "$pkgdir/usr/bin/gprojector"
}
