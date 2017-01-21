# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=1.14.2
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
sha256sums_i686=('ccc80571a5af6eedc34a6a55e8e45c3654114a9fc11774f14a4e05e60d99a5be')
sha256sums_x86_64=('f120441b8db8d1d23780a40b2b36ef0c551d7b207ee0d3cdad76e70684513ef6')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_71_$CARCH "$pkgdir"/usr/lib/php/modules/blackfire.so
}
