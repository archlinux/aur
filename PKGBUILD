# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=1.17.3
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php/conf.d/blackfire.ini')
depends=('glibc')

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_71_i686::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_i386-php-71.so")
source_x86_64=("blackfire.so-${pkgver}_71_x86_64::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_amd64-php-71.so")

sha256sums=('43f82aea3877cc0133cf2278cb85d0c612cf1f6c869ad430cbaa2b2598f78f33')
sha256sums_i686=('d9a2d62142eb7c3416a26aaabc6c1e9904822081a04a364845cef09baaac7d13')
sha256sums_x86_64=('3fbe53b63266936ec022e164d2c4d8145667e4a149eb8313594aebe310d7e77a')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_71_$CARCH "$pkgdir"/usr/lib/php/modules/blackfire.so
}
