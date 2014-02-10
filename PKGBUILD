# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.5.2
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('3c245a06fb14c2e1fd429d074e17389a8a3d4f3b6cc7c79597f9bc2bf976a5b7')
else
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('ba9167db32114d952a3dc474aa3060ba4bb36477f5c288e1b58c0a1637e410e6')
fi

package() {
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 "$srcdir/ioncube/ioncube_loader_lin_5.5.so" "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
