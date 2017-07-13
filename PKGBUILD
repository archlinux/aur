# Maintainer: Ivan Wu <2967948168@qq.com>
pkgname=nali
pkgver=0.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/qqwry/"
license=('GPL')
depends=('sh')
pkgdesc="qqwry"
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/qqwry/nali-$pkgver.tar.gz")
md5sums=('314f611dd72bdbbcf53c8a182fb20cc1')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --datadir=$pkgdir/usr/share --bindir=$pkgdir/usr/bin
  make
}

package() {
  mkdir -p $pkgdir/usr/{share,bin}
  cd "$srcdir"/$pkgname-$pkgver
  make install
}

# vim:set ts=2 sw=2 et:
