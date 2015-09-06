pkgname=laszip
pkgver=2.2.0
pkgrel=4
pkgdesc="Quickly turns bulky LAS files into compact LAZ files without information loss."
arch=('i686' 'x86_64')
url="http://www.laszip.org/"
license=('LGPL')
source=(https://github.com/LASzip/LASzip/releases/download/v$pkgver/$pkgname-src-$pkgver.tar.gz)
md5sums=('1693724d8284dc04f04eb0b86f7de2cc')

build() {
  cd "$srcdir/$pkgname-src-$pkgver"
  ./configure --prefix=/usr --includedir=/usr/include/${pkgname}
  make
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver"
  make DESTDIR="$pkgdir/" install
}
