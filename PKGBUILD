# Maintainer: reck1610 <reck1610@gmail.com>
# Contributor: reck1610 <reck1610@gmail.com>

pkgname=binarix
pkgver=0.2a
pkgrel=1
pkgdesc="binarix - a matrix styled linux console locker"
arch=('i686' 'x86_64')
url="https://gitlab.com/reck1610/binarix"
license=('GPL2')
depends=('ncurses' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/reck1610/binarix/repository/archive.tar.gz?ref=release%2F0.2a")
#source=("http://raffi.at/code/$pkgname-$pkgver.tar.gz" "$pkgname.patch")
md5sums=('2e1ea4611e5e0824885d919f26a9e9b2')

build() {
  cd "$srcdir"
  mv "$pkgname-release/"$(ls "$pkgname-release") "$pkgname-$pkgver"
  rm -rf "$pkgname-release"
  cd "$srcdir/$pkgname-$pkgver"
  #patch -p1 -i "$srcdir/$pkgname.patch" "$pkgname.c"
  make all
}

package() {
  mkdir "$pkgdir/bin/"
  cd "$srcdir/$pkgname-$pkgver"
  install -m4555 -o root $pkgname "$pkgdir/bin/"
}

