# Maintainer: grimi <grimi at poczta dot fm>

pkgname=uade
pkgver=2.13
pkgrel=2
pkgdesc="Unix Amiga Delitracker Emulator"
arch=('i686' 'x86_64')
url="http://zakalwe.fi/uade"
license=('GPL')
depends=('libao' 'fuse')
makedepends=('pkg-config')
install=uade.install
source=("http://zakalwe.fi/uade/uade2/$pkgname-$pkgver.tar.bz2")
md5sums=('29bb1018b7fa58f93b246264c160bdc6')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --package-prefix="$pkgdir" --without-audacious
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

