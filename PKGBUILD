# Maintainer: Ha The Tung <me AT tunght DOT com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
pkgname=php70-blackfire
pkgver=1.18.2
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

sha256sums=('6e45b41bdb9d5c974c28170fb9b8d3ffe1a2d1eaef187157fa8598973e30fb8e')
sha256sums_i686=('c122f7ac41e2226673e9b12c8900f6c5e701aa5c97a21e7ef76c28f861ed8383')
sha256sums_x86_64=('36b0968bc92c053504d3862453baebc07519c2abeeeea9d120dedb2e7ef7a5f5')

package(){
  install -Dm 644 blackfire.ini "$pkgdir"/etc/php70/conf.d/blackfire.ini
  install -Dm 755 blackfire.so-${pkgver}_70_$CARCH "$pkgdir"/usr/lib/php70/modules/blackfire.so
}
