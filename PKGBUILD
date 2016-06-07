# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=5.1.2
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(ioncube_loader-i686-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.bz2)
source_x86_64=(ioncube_loader-x86_64-$pkgver.tar.bz2::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2)

sha256sums_i686=('a0a73e0d1481a044fd17d9089e56dcc1d0c79d158f4779f58810c8db3f64ef2a')
sha256sums_x86_64=('2482f7f928601dbbe112244030d33c9c2a4abf9ba2c58d24de6d70460c44f797')

package() {
	cd "$srcdir"/ioncube
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube_loader_lin_5.6.so "$pkgdir"/usr/lib/php/modules/ioncube_loader.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini

	install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -Dm0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
	install -Dm0644 USER-GUIDE.txt "$pkgdir"/usr/share/doc/$pkgname/USER-GUIDE.txt
}
