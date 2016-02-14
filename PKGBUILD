pkgname=cmake-lint
pkgver=1.3.4
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="http://github.com/richq/cmake-lint/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/richq/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('81bbc87d65a27a88a5121f58843d4c8c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
