# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-ioncube_loader
pkgver=10.2.1
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(ioncube_loader-i686-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loader-x86_64-$pkgver.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)

sha256sums_i686=('0b5c83f6634550f7a7db7fff0a19a6f9e79ff946233cd9c7eac4cfbdbd66bf11')
sha256sums_x86_64=('0d34d41bc43a870f5ad7de052515f81091c2552aad1daad7e017fb86a67d665a')

package() {
	cd "$srcdir"/ioncube
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube_loader_lin_7.2.so "$pkgdir"/usr/lib/php/modules/ioncube_loader.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini

	install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -Dm0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
	install -Dm0644 USER-GUIDE.txt "$pkgdir"/usr/share/doc/$pkgname/USER-GUIDE.txt
}
