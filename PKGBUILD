# Maintainer: Lucas Saliés Brum <lucas at archlinux dot com dot br>

pkgname=php7-ioncube_loader
pkgver=7.1
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
conflicts=('php-ioncube_loader')
backup=(etc/php/conf.d/00-ioncube_loader.ini)
source_i686=(ioncube_loaders_lin_x86.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86.tar.gz)
source_x86_64=(ioncube_loaders_lin_x86-64.tar.gz::https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz)
md5sums_i686=('0a6508505c7bfe06355a2a0d0f1f4ca5')
md5sums_x86_64=('093e4adb4a1e1a5208fbaa40625f3d98')

package() {
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube/ioncube_loader_lin_${pkgver}.so "$pkgdir"/usr/lib/php/modules/ioncube_loader_lin_${pkgver}.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader_lin_${pkgver}.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini
	install -Dm0644 ioncube/README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
	install -Dm0644 ioncube/loader-wizard.php "$pkgdir"/usr/share/doc/$pkgname/loader-wizard.php
}
