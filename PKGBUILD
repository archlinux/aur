# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.09.4
pkgrel=1
pkgdesc="Btrfs extent deduplication utility"
arch=('any')
url="https://github.com/markfasheh/duperemove"
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v$pkgver.tar.gz)
sha512sums=('dff728a34bdf8df71aa13b7f9c8ffae8ce643337f4dafacb3ceeb778d326b1885f63ae03215c6d714c4fcd7b2f26b03e47d7ad3a42eca3f2d5de5b596b653bf1')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 ./duperemove $pkgdir/usr/bin/duperemove
  install -Dm644 ./duperemove.8 $pkgdir/usr/share/man/man8/duperemove.8
}
