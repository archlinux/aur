# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=archive-sum
pkgver=1.0.1
pkgrel=1
pkgdesc="verify archive file integrity"
arch=('i686' 'x86_64')
url="https://github.com/idiv-biodiversity/archive-sum"
license=('MIT')
depends=('libarchive')
source=("https://github.com/idiv-biodiversity/archive-sum/releases/download/v$pkgver/archive-sum-$pkgver.tar.gz")
md5sums=('845847acb3b66ca1dbc32285407b502c')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
