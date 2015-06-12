# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=omni
pkgver=1.6a
pkgrel=2
pkgdesc="Fast OpenMP source to source compiler"
arch=('i686' 'x86_64')
url="http://www.hpcs.cs.tsukuba.ac.jp/omni-compiler/"
license=('LGPL')
depends=('bash' 'java-environment')
source=(http://www.hpcs.cs.tsukuba.ac.jp/omni-compiler/download/Omni-$pkgver.tar.gz)
md5sums=('1b61f04eebf699034ffcb1b0a19ca721')

build() {
  cd "$srcdir/Omni-$pkgver"
  ./configure --prefix=/usr --exec-prefix=/usr --enable-gcc
  make
}

package() {
  cd "$srcdir/Omni-$pkgver"
  make DESTDIR=$pkgdir install
  chmod 755 $pkgdir/usr/include
  chmod 755 $pkgdir/usr/bin
}
