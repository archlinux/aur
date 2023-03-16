pkgname=today-todo
pkgver=1.0.0
pkgrel=1
pkgdesc="A command line todo list"
arch=('i686' 'x86_64')
url="https://github.com/heartheart3/today"
license=('BSD')
conflicts=('today')
makedepends=(
  'git'
  'cmake'
  'gcc'
  'boost'
  'boost-libs'
)
source=("today-${pkgver}.tar.gz::https://github.com/heartheart3/today/archive/v${pkgver}.tar.gz")
sha1sums=('690f125d44a30157920bc27a14a3e5fbf8b0ac49')

build() {
  cd "$srcdir/today-$pkgver"
  ls .
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  make
}

package() {
  cd "$srcdir/today-$pkgver/build"
  make install
}
