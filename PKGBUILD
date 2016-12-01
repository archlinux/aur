pkgname=cmake-lint
pkgver=1.4
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="http://github.com/richq/cmake-lint/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/richq/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ab453e14929ccfb31ff610f5d953ce79')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
