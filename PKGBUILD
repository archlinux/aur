# Maintainer: trya <tryagainprod@gmail.com>

pkgname=cutemupen
pkgver=0.1.1
pkgrel=1
pkgdesc="A Qt front-end for Mupen64Plus"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cutemupen"
license=('GPL')
depends=('mupen64plus>=1.99' 'qt4')
source=("http://downloads.sourceforge.net/project/cutemupen/0.1.1/cutemupen-src-0.1.1.tar.bz2")
sha1sums=('5d8d1e529063089849f3af401225c354fc229ddd')

build() {
  cd "$srcdir/$pkgname-src-$pkgver"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver"
  install -Dm755 cutemupen "$pkgdir/usr/bin/cutemupen"
}
