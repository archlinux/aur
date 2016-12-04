# Maintainer: reck1610 <reck1610@gmail.com>
# Contributor: reck1610 <reck1610@gmail.com>

pkgname=binarix
pkgver=0.3
pkgrel=1
pkgdesc="binarix - a matrix styled linux console locker"
arch=('i686' 'x86_64')
url="https://gitlab.com/reck1610/binarix"
license=('GPL2')
depends=('ncurses' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/reck1610/$pkgname/repository/archive.tar.gz?ref=release%2F$pkgver")
md5sums=('3690cb489a9502589031cb9e4f63bf7f')

build() {
  cd "$srcdir"
  mv "$pkgname-release/"$(ls "$pkgname-release") "$pkgname-$pkgver"
  rm -rf "$pkgname-release"
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cd "$srcdir/$pkgname-$pkgver"
  install -m4555 -o root $pkgname "$pkgdir/usr/bin/"
}

