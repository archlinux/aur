# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Christoph Lohmann <20h@r-36.net>

pkgname=geomyidae
pkgver=0.26.3
pkgrel=1
pkgdesc="Tiny, standalone Gopher daemon written in C"
arch=('i686' 'x86_64')
url="http://www.r-36.net/src/geomyidae"
license=('MIT')
source=("http://www.r-36.net/src/geomyidae/$pkgname-$pkgver.tar.gz")
backup=("etc/conf.d/$pkgname")
md5sums=('3d8bb8601f37ca953b00fc2445ab5abe')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 rc.d/Archlinux.conf.d $pkgdir/etc/conf.d/geomyidae
}
