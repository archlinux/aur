# Maintainer: reck1610 <reck1610@gmail.com>
# Contributor: reck1610 <reck1610@gmail.com>

pkgname=binarix
pkgver=0.2a
pkgrel=1
pkgdesc="binarix - a matrix styled linux console locker"
arch=('i686' 'x86_64')
url="http://raffi.at/view/code/$pkgname"
license=('GPL2')
depends=('ncurses' 'glibc')
source=("http://raffi.at/code/$pkgname-$pkgver.tar.gz" "$pkgname.patch")
md5sums=('177638b1265c9866a7d0e048493fe67b'
         'd6a8fb386a10a2576eff2b32e8ca6df5')

build() {
  mv "$srcdir/$pkgname" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname.patch" "$pkgname.c"
  make all
}

package() {
  mkdir "$pkgdir/bin/"
  cd "$srcdir/$pkgname-$pkgver"
  install -m4555 -o root $pkgname "$pkgdir/bin/"
}

