pkgname=threadpool11-git
pkgdesc='A fast, lock-free, cross-platform C++11 thread pooling library that is aiming to be lightweight and simple.'
pkgver=3.0.0.r3.g8998e5c
pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
source=("$pkgname"'::git+https://github.com/tghosgor/threadpool11.git')
arch=('any')
url='https://github.com/tghosgor/threadpool11'
license=('MIT')
makedepends=(
  'boost'
  'cmake'
  'git'
  'make'
)
sha512sums=('SKIP')
options=('staticlibs')

package() {
  cd "$srcdir"/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
  make install
}
