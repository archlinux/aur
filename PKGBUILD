# Maintainer: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.1.0
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=1.5' 'gcc-libs' 'cgal')
makedepends=('cmake>=2.8.8' 'boost')
source=("https://github.com/pgRouting/pgrouting/archive/$pkgname-$pkgver.tar.gz")
md5sums=('c500b11d63893ba295ff6ef8ed255093')

prepare() {
  cd $srcdir
  mv $pkgname-$pkgname-$pkgver $pkgname-$pkgver
  cd $pkgname-$pkgver

  [[ -d build ]] || mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake  ../

  make
}

package() {
        cd $pkgname-$pkgver
        make -C build DESTDIR="$pkgdir/" install
}
