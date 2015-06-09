pkgname=threadpool11-git
pkgdesc='A fast, lock-free, cross-platform C++11 thread pooling library that is aiming to be lightweight and simple.'
pkgver=2.0.6.r3.g31e6849
pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
source=("$pkgname"'::git+https://github.com/tghosgor/threadpool11.git')
arch=('any')
url=('https://github.com/tghosgor/threadpool11')
license=('LGPL3')
makedepends=(
  'boost' # Boost.Lockfree is used, there is an internal copy if you do not have it installed but we want it to be recent for this.
)
sha512sums=('SKIP')
options=('staticlibs')

package() {
  cd "$srcdir"/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
  make install
}
