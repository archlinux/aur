# Maintainer: ivanp7 <ivanpzv8 at gmail dot com>
pkgname=im2a
pkgver=0.6.0
pkgrel=1
pkgdesc="An image to ASCII converter, made for 256-color terminals."
arch=('i686' 'x86_64')
url="https://github.com/tzvetkoff/"
license=('custom')
depends=('imagemagick')
source=($url/$pkgname/archive/v$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  make DESTDIR=$pkgdir install
}

md5sums=('a58101f3e14485ac687b0de1602c56fa')

