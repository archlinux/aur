# Maintainer: grimi <grimi at poczta dot fm>

pkgname=libxmp
pkgver=4.3.10
pkgrel=1
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=('i686' 'x86_64')
url="http://xmp.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://download.sourceforge.net/project/xmp/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('273f46974ed475fd80eadbb1e925fd64')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

