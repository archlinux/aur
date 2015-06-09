# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.09.3
pkgrel=2
pkgdesc="Btrfs extent deduplication utility"
arch=('any')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v0.09.3.tar.gz)
sha512sums=('fe2a19088ec9ac3dda35da8b9580ddcc1c3b49e60824f2c1bbf8c013756c060b4c9663d1977bb6622c4de19754fd4a1011cc09ef3c785c2b4b218e0c9fb15b87')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 ./duperemove $pkgdir/usr/bin/duperemove
  install -Dm644 ./duperemove.8 $pkgdir/usr/share/man/man8/duperemove.8
}
