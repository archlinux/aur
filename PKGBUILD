# Maintainer: jjk
pkgname=fixsrcip
pkgver=0.1
pkgrel=1
pkgdesc="Allow to force bind/connect using the specified IP"
arch=('i686' 'x86_64')
url="http://0pointer.de/lennart/projects/fixsrcip"
license=('LGPL')
source=(http://0pointer.de/lennart/projects/fixsrcip/$pkgname-$pkgver.tar.gz)
md5sums=('9ca2b93dea7a6b994b7e4b092caa0d63')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
  sed -i 's#FIXSRCIPSO="./fixsrcip.so"#FIXSRCIPSO="/usr/lib/fixsrcip.so"#' fixsrcip
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 fixsrcip "$pkgdir/usr/bin/fixsrcip"
  install -D -m755 fixsrcip.so "$pkgdir/usr/lib/fixsrcip.so"
}

# vim:set ts=2 sw=2 et:
