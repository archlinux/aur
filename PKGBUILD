# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=php7-ioncube_loader
pkgver=beta4
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
conflicts=('php-ioncube_loader')
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(php7-linux-x86-$pkgver.tgz::https://www.ioncube.com/php7-linux-x86-beta4.tgz)
source_x86_64=(php7-linux-x86-64-$pkgver.tgz::https://www.ioncube.com/php7-linux-x86-64-beta4.tgz)

md5sums_i686=('28b2207833a96d47304f2ec0341ccf86')
md5sums_x86_64=('d8f5106db833943e0b544f34cab72713')

package() {
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube_loader_lin_x86-64_7.0b4.so "$pkgdir"/usr/lib/php/modules/ioncube_loader_lin_7.0.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader_lin_7.0.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini
	install -Dm0644 README_PHP7_X86_64_BETA "$pkgdir"/usr/share/doc/$pkgname/README.txt
}
