pkgname=hmat-oss
pkgver=1.1.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
md5sums=('b4525676859f005f64e8d708356e404a')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_INCLUDE_DIR=/usr/include/hmat .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
