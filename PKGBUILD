# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.2.2
pkgrel=2
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	sha256sums=('060592f8ac8392c3b213b9c534d4cf17c798481b97390d79435c3ab0b220b254')
else
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	sha256sums=('638a3e3ef5e51db0c6e827c4bc4172365ec440bdf4f41f44cad39c313ce1d209')
fi

build() {
	cd "$srcdir"

	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 ioncube/ioncube_loader_lin_5.4.so "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
# 	install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
