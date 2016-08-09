# Maintainer: SaultDon <sault.don gmail>
# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=pgrouting
pkgver=2.2.3
pkgrel=1
pkgdesc="Adds routing functionality to PostGIS/PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgrouting.org/"
license=('GPL2')
depends=('postgis>=1.5' 'gcc-libs' 'cgal')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/pgRouting/$pkgname/tar.gz/$pkgname-$pkgver")
md5sums=('4f80700311cfab55bb37ac0705ebcc31')
options=(!makeflags)

prepare() {
  cd $srcdir
  mv $pkgname-$pkgname-$pkgver $pkgname-$pkgver

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
