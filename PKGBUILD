# Maintainer: grimi <grimi at poczta dot fm>

pkgname=libxmp
pkgver=4.3.9
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f86f9b94d1512d0eea93890a4bf384ab')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

