pkgname=cmake-lint
pkgver=1.3.2
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="http://github.com/richq/cmake-lint/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/richq/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b77970daeed473b78cc86d07e580ba96')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}
