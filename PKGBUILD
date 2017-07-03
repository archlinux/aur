# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=6.1.0
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(ioncube_loader-i686-$pkgver.tar.gz::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-$pkgver.tar.gz::http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)

sha256sums_i686=('085ad1e64213d6887ded9b60cc8e2afa743e32abe4558e1a67e31706fcbcc4e6')
sha256sums_x86_64=('8a191d9776bdb27bfec4b0c3aa341eacfeef6185c6f0a0261ff6203dd8c7a6e5')

package() {
	cd "$srcdir"/ioncube
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube_loader_lin_7.0.so "$pkgdir"/usr/lib/php/modules/ioncube_loader.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini

	install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -Dm0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
	install -Dm0644 USER-GUIDE.txt "$pkgdir"/usr/share/doc/$pkgname/USER-GUIDE.txt
}
