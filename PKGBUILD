pkgname=hmat-oss
pkgver=1.8.1
pkgrel=1
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapacke')
makedepends=('cmake')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz")
sha256sums=('59bf742ed13f313c622b0710b565098a4de60a38e0700f63842c576bd398b941')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

