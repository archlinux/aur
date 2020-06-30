# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>
_name=autoflake
pkgname=python-autoflake
pkgver=1.3.1
pkgrel=2
pkgdesc='Removes unused imports and unused variables'
arch=(any)
url="https://github.com/myint/$_name"
license=("MIT")
depends=('python-pyflakes')
makedepends=('python')
source=("https://github.com/myint/$_name/archive/v1.3.1.tar.gz")
sha256sums=('c271b46565e61cd6f754ed456cb1139d88615a821c6f31a6c621eccd15c7fa84')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
