# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=4.0.8
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)

if [[ $CARCH == "x86_64" ]]; then
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)
	md5sums=('7a393d14c8856ed1f66af9e715afa054')
else
	source=(http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
	md5sums=('d4c732f2c24f4a196e682eed3e91ff39')
fi

build() {
	cd $srcdir/ioncube

	install -d -m0755 $pkgdir/etc/php/conf.d
	install -D -m0755 ioncube_loader_lin_5.3.so $pkgdir/usr/lib/php/modules/ioncube_loader.so
	install -D -m0644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > $pkgdir/etc/php/conf.d/00-ioncube_loader.ini
}
