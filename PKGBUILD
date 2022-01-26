# Maintainer: Sebastian Dornack <sebastian AT dorni DOT net>
# Contributor: Jérôme Deuchnord <jerome@deuchnord.fr>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=1.73.0
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php/conf.d/blackfire.ini')
depends=('glibc' 'php')

# Change this if you need to support an older version of PHP (think to update the SHA256 sums too)
PHP_VERSION="81"

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_${PHP_VERSION}_i686::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_i386-php-${PHP_VERSION}.so")
source_x86_64=("blackfire.so-${pkgver}_${PHP_VERSION}_x86_64::http://packages.blackfire.io/binaries/blackfire-php/${pkgver}/blackfire-php-linux_amd64-php-${PHP_VERSION}.so")

sha256sums=('43f82aea3877cc0133cf2278cb85d0c612cf1f6c869ad430cbaa2b2598f78f33')
sha256sums_i686=('1c9740597d69ef3587d30f2d5f4d5a905b733cb8bf204ec663b87fe98830393c')
sha256sums_x86_64=('8b8cea11838c49a9369f57f381dae4d834763534832fd26f3e8dd06cb12f3d5c')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_${PHP_VERSION}_$CARCH "$pkgdir"/usr/lib/php/modules/blackfire.so
}
