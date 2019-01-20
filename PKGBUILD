# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-pear
epoch=1
pkgver=1.10.9
pkgrel=1
arch=('any')
pkgdesc='PHP Extension and Application Repository'
url='https://pear.php.net/'
depends=('php')
makedepends=('git')
license=('PHP')
source=('git+https://github.com/pear/pearweb_phars.git#commit=d9de1f192eefbbedbc56eba23168deb6c8515059')
backup=('etc/php/pear.conf')
sha256sums=('SKIP')

package() {
	PHP_PEAR_SYSCONF_DIR=/etc/php \
	INSTALL_ROOT=$pkgdir \
		php -n ${srcdir}/pearweb_phars/install-pear-nozlib.phar \
			-d /usr/share/pear \
			-b /usr/bin

	rm -rf ${pkgdir}{/usr/share/pear/,/}.{channels,depdb,depdblock,filemap,lock,registry}
}
