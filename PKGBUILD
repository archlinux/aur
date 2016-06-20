# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php-blackfire
pkgver=1.10.6
pkgrel=1
pkgdesc='Blackfire Profiler - PHP extension'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
backup=('etc/php/conf.d/blackfire.ini')
depends=('glibc')

source=('blackfire.ini')
source_i686=("blackfire.so-${pkgver}_70_i686::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_i386-php-70.so")
source_x86_64=("blackfire.so-${pkgver}_70_x86_64::http://packages.blackfire.io/binaries/blackfire-php/$pkgver/blackfire-php-linux_amd64-php-70.so")

sha256sums=('43f82aea3877cc0133cf2278cb85d0c612cf1f6c869ad430cbaa2b2598f78f33')
sha256sums_i686=('6e00b25cf94a0b37caa654825068a0bd9fdc0791840c75ba4c0643886bb70bf1')
sha256sums_x86_64=('413c5a7235a1e3ff96793f463b7335e0ca736d8c0de176431c832b01df899608')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_70_$CARCH "$pkgdir"/usr/lib/php/modules/blackfire.so
}
