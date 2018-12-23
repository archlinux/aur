# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.7
pkgrel=2
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
license=('PHP')
source=('https://pear.php.net/install-pear-nozlib.phar')
backup=('etc/php/pear.conf')
sha256sums=('96eb42707944630552a76865aec8645c0fd4c32698ad34f1b29946affeed1485')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n ${srcdir}/install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}{/usr/share/pear/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
