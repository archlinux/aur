# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>
_name=autoflake
pkgname=python-autoflake
pkgver=1.4
pkgrel=1
pkgdesc='Removes unused imports and unused variables'
arch=(any)
url="https://github.com/myint/$_name"
license=("MIT")
depends=('python-pyflakes')
makedepends=('python')
source=("https://github.com/myint/$_name/archive/v${pkgver}.tar.gz")
sha256sums=('b3c573b0ab507b22359e80bdfd4c3fcf64b1b1d3352a6209a9fe73116c0ed36e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
