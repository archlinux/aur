# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.2.2
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

if [[ $CARCH == "x86_64" ]]; then
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	md5sums=('87755369e44bdf7897b111f20c021cce')
else
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	md5sums=('393fcc30775f57e01675665ce5861f34')
fi

build() {
	cd "$srcdir"

	install -d -m0755 "$pkgdir/etc/php/conf.d"
	install -D -m0755 ioncube/ioncube_loader_lin_5.4.so "$pkgdir/usr/lib/php/modules/ioncube_loader.so"
# 	install -D -m0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir/etc/php/conf.d/00-ioncube_loader.ini"
}
