# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.10
pkgrel=1
pkgdesc="Btrfs extent deduplication utility"
arch=('x86_64' 'i686')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v$pkgver.tar.gz)
sha512sums=('11bb1a9937b9ca7969b9176bb4cfc8fff91c257a8645baa0ca0ec6b634ae3c464712414f856d5a75ed16c6d13f0ae85ac3584df1f474575a975cb20ae0d7a9f1')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 ./duperemove $pkgdir/usr/bin/duperemove
  install -Dm644 ./duperemove.8 $pkgdir/usr/share/man/man8/duperemove.8
}
