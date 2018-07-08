# $Id: $
# Maintainer: Arjun Nemani <nemaniarjun@gmail.com>

pkgname=php5-pear
epoch=1
pkgver=1.10.5
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='http://pear.php.net/'
depends=('php')
license=('PHP')
source=('https://pear.php.net/install-pear-nozlib.phar')
backup=('etc/php/pear.conf')
md5sums=('746dc5b681063e792152730770b36d21')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n ${srcdir}/install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}/.{channels,depdb,depdblock,filemap,lock,registry}
}
