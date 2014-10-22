# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.7.0
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('95294332df10bea1b952e7ebc4c0e2c07c5ec0ed586852eac1fcb919eda14ff7')
else
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('cd70ce5cf9a6554142a8a97a0c19522cb68e7555525a2ef959b2d766d9090b51')
fi

package() {
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 "$srcdir/ioncube/ioncube_loader_lin_5.5.so" "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
