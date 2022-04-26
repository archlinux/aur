# Maintainer: Elisamuel Resto <sam@samresto.dev>
# Contributor: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ds
pkgver=1.2.9
pkgrel=2
pkgdesc='Data structures for PHP 7.'
url='https://github.com/php-ds/extension'
license=('MIT')
arch=('any')
depends=('php7')
conflicts=('php-ds-git')
backup=('etc/php/conf.d/ds.ini')
source=(https://github.com/php-ds/extension/archive/v$pkgver.tar.gz
        ds.ini)
md5sums=('ecf0a09247d25aedfa5588ec783a5ede'
         'a50c990f8285a21242caa1a955a35707')

build() {
  cd $srcdir/ext-ds-$pkgver
  phpize7
  ./configure
  make
}

package() {
  install -Dm744 $srcdir/ext-ds-$pkgver/modules/ds.so $pkgdir/usr/lib/php7/modules/ds.so
  install -Dm644 ds.ini $pkgdir/etc/php7/conf.d/ds.ini
}

# vim:set ts=2 sw=2 et:
