pkgname=cmake-lint
pkgver=1.3.1
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="http://github.com/richq/cmake-lint/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/richq/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0c333de7351e2fc72a4a7bb247ed6712')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
