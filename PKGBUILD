# Maintainer: Dima Volkov <dimaac@bk.ru>
pkgname=dimanet
pkgver=1.3
pkgrel=1
pkgdesc="DimaNet is another bad integration of a neural network library written in ANSI C."
arch=('any')
url="https://github.com/dimalmfao/dimanet"
license=('GPL-3.0')
depends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimalmfao/dimanet/archive/master.tar.gz")
sha256sums=('7af031863f4039df5875ae7c20de715a34065481220e36a4b8aaeb87b04add50')

build() {
  cd "$srcdir/dimanet-master"
  make compile lib
}

package() {
  cd "$srcdir/dimanet-master"
  make install-lib DESTDIR="$pkgdir"
}

