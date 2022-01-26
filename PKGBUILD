# Maintainer: Sebastian Dornack <sebastian AT dorni DOT net>
# Contributor: Jérôme Deuchnord <jerome@deuchnord.fr>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php7-blackfire
pkgver=1.73.0
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php7/conf.d/blackfire.ini')
depends=('glibc' 'php7')

# Change this if you need to support an older version of PHP (think to update the SHA256 sums too)
PHP_VERSION="74"

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_${PHP_VERSION}_i686::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_i386-php-${PHP_VERSION}.so")
source_x86_64=("blackfire.so-${pkgver}_${PHP_VERSION}_x86_64::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_amd64-php-${PHP_VERSION}.so")

sha256sums=('36b16813ba15f5cd88691a1d7c04da1797eaf676f90b8182b1c50abc05e065e2')
sha256sums_i686=('0c694751b72cf7dc9c1e4de926b9ab2b4c5cfed481bcdf8c9c1f6b6cc2776242')
sha256sums_x86_64=('2d7d381f070354e83d21f7fbc83db752523d088c22dd69fafb24dfa911eac927')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php7/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_${PHP_VERSION}_$CARCH "$pkgdir"/usr/lib/php7/modules/blackfire.so
}
