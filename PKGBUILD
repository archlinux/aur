# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=libbigwig
pkgver=0.3.0
pkgrel=1
pkgdesc="library for handling bigWig files"
arch=('i686' 'x86_64')
url="https://github.com/dpryan79/libBigWig"
depends=('curl')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dpryan79/libBigWig/archive/$pkgver.tar.gz")
md5sums=('06c9d8dd9812808530be7eee8fe82f6d')

build() {
  cd $srcdir/libBigWig-$pkgver

  make
}

package() {
  cd $srcdir/libBigWig-$pkgver

  make prefix=$pkgdir/usr install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
