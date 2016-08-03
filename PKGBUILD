# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ds
pkgver=1.1.1
pkgrel=2
pkgdesc='Data structures for PHP 7.'
url='https://github.com/php-ds/extension'
license=('MIT')
arch=('any')
depends=('php')
conflicts=('php-ds-git')
backup=('etc/php/conf.d/ds.ini')
source=(https://pecl.php.net/get/ds-$pkgver.tgz
        ds.ini)
md5sums=('09918ccb417a599dd5089b4db5cf9d63'
         'a50c990f8285a21242caa1a955a35707')

build() {
  cd $srcdir/ds-$pkgver
  phpize
  ./configure
  make
}

package() {
  install -Dm744 $srcdir/ds-$pkgver/modules/ds.so $pkgdir/usr/lib/php/modules/ds.so
  install -Dm644 ds.ini $pkgdir/etc/php/conf.d/ds.ini
}

# vim:set ts=2 sw=2 et:
