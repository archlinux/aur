# Contributor: haru_nak <uobikiemukot at gmail dot com>
pkgname=idump
pkgver=0.2.0
pkgrel=1
pkgdesc="tiny image viewer for framebuffer"
arch=('i686' 'x86_64')
url="https://github.com/uobikiemukot/idump"
license=('MIT')
depends=('libpng' 'libjpeg-turbo')
makedepends=()
source=($url/archive/v$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  export LDFLAGS="-lpng -ljpeg";
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin/
  install -m755 ./idump $pkgdir/usr/bin/idump
}
md5sums=('9c2a1c000eb9ec57df41006f4c52d319')
