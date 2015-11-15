# Maintainer: Will Alexander <archlinux dot org at willalexander dot me>

pkgname=sic
pkgver=1.2
pkgrel=4
pkgdesc="An extremely simple IRC client"
url="http://tools.suckless.org/sic/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=(http://dl.suckless.org/tools/sic-$pkgver.tar.gz)
md5sums=('eb099e790c3ce7866df50d3fe1a52c25')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}
