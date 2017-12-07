# Maintainer: Ha The Tung <me AT tunght DOT com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php70-blackfire
pkgver=1.18.0
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php70/conf.d/blackfire.ini')
depends=('glibc')

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_70_i686::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_i386-php-70.so")
source_x86_64=("blackfire.so-${pkgver}_70_x86_64::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_amd64-php-70.so")

sha256sums=('43f82aea3877cc0133cf2278cb85d0c612cf1f6c869ad430cbaa2b2598f78f33')
sha256sums_i686=('9c2ab1f5efade6c37c86aad078e4c60f790a5cc97ce01067d833a0913bef1cd5')
sha256sums_x86_64=('9d909c7d16f8b062d7dbb8eca0de95778218e227f7817511522e5120a4659fcf')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php70/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_70_$CARCH "$pkgdir"/usr/lib/php70/modules/blackfire.so
}
