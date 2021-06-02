# Maintainer: Sebastian Dornack <sebastian AT dorni DOT net>
# Contributor: Jérôme Deuchnord <jerome@deuchnord.fr>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php7-blackfire
pkgver=1.59.1
pkgrel=0
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php7/conf.d/blackfire.ini')
depends=('glibc' 'php7')

# Change this if you need to support an older version of PHP (think to update the SHA256 sums too)
PHP_VERSION=74

PHP_VERSION="74"

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_${PHP_VERSION}_i686::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_i386-php-${PHP_VERSION}.so")
source_x86_64=("blackfire.so-${pkgver}_${PHP_VERSION}_x86_64::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_amd64-php-${PHP_VERSION}.so")

sha256sums=('36b16813ba15f5cd88691a1d7c04da1797eaf676f90b8182b1c50abc05e065e2')
sha256sums_i686=('1241c338a465fb00bc7876d1a7382e749e911bb68835d5860a76c6eef2dd9e36')
sha256sums_x86_64=('009ca040a870e0b48c4e727b0b9dbfc56fabc453427b14763f42a544aaac0184')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php7/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_${PHP_VERSION}_$CARCH "$pkgdir"/usr/lib/php7/modules/blackfire.so
}
