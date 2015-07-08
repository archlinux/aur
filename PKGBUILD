# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.09.5
pkgrel=1
pkgdesc="Btrfs extent deduplication utility"
arch=('any')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v$pkgver.tar.gz)
sha512sums=('111127d9ab7d5567de8393197cf5bc977db1f64b7405fd848e1ca5aaa5ca7a3057fa06b61b161d0dfc45e0c5ebcc2406218d9a834db519c7ca348cdc7a0fe2f2')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 ./duperemove $pkgdir/usr/bin/duperemove
  install -Dm644 ./duperemove.8 $pkgdir/usr/share/man/man8/duperemove.8
}
