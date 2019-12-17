# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=cadabra2
pkgver=2.2.8
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="http://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=('python' 'sqlite3' 'boost' 'gtkmm3')
makedepends=('cmake')
source=("https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('72786423b2ff847e8e0035326a8f1b2cdcf76a68c77f95588276bbccfaa74d7e')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake ..\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSQLITE3_INCLUDE_DIR=/usr/include
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}

