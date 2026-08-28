pkgname=libmixmod
pkgver=2.1.12
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('x86_64')
url="https://github.com/mixmod"
license=('GPL-3.0-or-later')
depends=(libgcc libgomp libstdc++ glibc)
makedepends=('cmake' 'eigen')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dd6c0d1fef7f2aa80e0c77680baa0718aa6326302bfd11b7e5dd99a378e5b277')

prepare() {
  cd "$srcdir"/mixmod-${pkgver}
}

build () {
  cd "$srcdir"/mixmod-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_UNITY_BUILD=ON .
  make
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  make install DESTDIR="$pkgdir"
}
