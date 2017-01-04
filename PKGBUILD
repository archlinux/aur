# Maintainer: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.3.1
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=1.5' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pgRouting/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('f92f5d5dc8378f65a4012de691c8a726')

prepare() {
   cd $pkgname-$pkgver

  [[ -d build ]] || mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake -L ../

  make
}

package() {
        cd $pkgname-$pkgver
        make -C build DESTDIR="$pkgdir/" install
}
