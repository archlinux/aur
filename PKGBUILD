pkgname=hmat-oss
pkgver=1.9.0
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapacke')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('f45e71d1c4de157071adce36642239aa8e2b63e08caa85f59cf656519993ace1')

build() {
  cd $pkgname-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

