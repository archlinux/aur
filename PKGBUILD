# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=0.24.2
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license='custom'
backup=('etc/php/conf.d/blackfire.ini')
depends=('glibc')

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_56_i686::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_i386-php-56.so")
source_x86_64=("blackfire.so-${pkgver}_56_x86_64::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_amd64-php-56.so")

sha256sums=('43f82aea3877cc0133cf2278cb85d0c612cf1f6c869ad430cbaa2b2598f78f33')
sha256sums_i686=('ae16e662855f70bddb32e7b4d5aa99fde30d55f49f0dcd6c8c2c2f592133401d')
sha256sums_x86_64=('4d097c586d725181b17543ce4a4adf95db42056502b5a2f315c74b9f98230bb9')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_56_$CARCH "$pkgdir"/usr/lib/php/modules/blackfire.so
}
