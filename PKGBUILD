# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=bucky
pkgver=1.4.4
pkgrel=1
pkgdesc='bayesian concordance analysis'
arch=('i686' 'x86_64')
url="http://www.stat.wisc.edu/~ane/bucky/index.html"
license=('GPL2')
depends=('gcc-libs')
makedepends=('boost')
source=("http://www.stat.wisc.edu/~ane/bucky/v1.4/$pkgname-$pkgver.tgz")
md5sums=('f0c910dd1d411d112637826519943a6d')

prepare() {
  cd $srcdir/$pkgname-$pkgver/src

  rm -rf boost
}

build() {
  cd $srcdir/$pkgname-$pkgver/src

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src

  install -Dm755 bucky $pkgdir/usr/bin/bucky
  install -Dm755 mbsum $pkgdir/usr/bin/mbsum
}
