# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: nsf <no.smile.face@gmail.com>

pkgname=bmpanel
pkgver=0.9.27
pkgrel=6
pkgdesc="A modern, NETWM compliant, bitmap theme-based x11 panel."
arch=('i686' 'x86_64')
url="http://nsf.110mb.com/bmpanel/"
license=('custom')
depends=('imlib2' 'fontconfig' 'libxrender' 'libxcomposite' 'ttf-dejavu')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nsf/bmpanel/archive/$pkgver.tar.gz")
md5sums=('042f3cfd1da27ea2b287980add42aafc')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make 
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  DESTDIR=$pkgdir make install

  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
