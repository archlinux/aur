# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.5.0
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('178cda96e05665cd6410aab8456ac3376c471bf67a80867b843385851d8f903a')
else
	source=(ioncube_loader-$CARCH-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('ac3026b3f2587f873d81e5e5c678155237379e5a4b00d293be77128d27c3fe61')
fi

package() {
	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 "$srcdir/ioncube/ioncube_loader_lin_5.5.so" "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
