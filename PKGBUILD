# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ds
pkgver=1.1.7
pkgrel=1
pkgdesc='Data structures for PHP 7.'
url='https://github.com/php-ds/extension'
license=('MIT')
arch=('any')
depends=('php')
conflicts=('php-ds-git')
backup=('etc/php/conf.d/ds.ini')
source=(https://github.com/php-ds/extension/archive/v$pkgver.tar.gz
        ds.ini)
md5sums=('f1f24b8870e386e142f443375753999a'
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
