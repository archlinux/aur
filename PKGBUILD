# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
pkgver=1.10.1
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='http://pear.php.net/'
depends=('php')
license=('PHP')
source=('https://pear.php.net/install-pear-nozlib.phar')
backup=('etc/php/pear.conf')
md5sums=('64d0cee159de5655e0fadc54b89c34f9')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n ${srcdir}/install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}/usr/share/pear/.{channels,depdb,depdblock,filemap,lock,registry}
}
