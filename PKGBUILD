# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Jeff M Hubbard <jeffmhubbard@gmail.com>
# Contributor: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=python-colormath
pkgver=3.0.0
pkgrel=4
pkgdesc="Python module that abstracts common color math operations"
arch=('any')
url="https://github.com/gtaylor/python-colormath"
license=('GPL3')
depends=(python-networkx python-numpy)
makedepends=(python-build python-installer python-wheel)
source=(colormath-$pkgver.tar.gz::https://github.com/gtaylor/python-colormath/archive/3.0.0.tar.gz)
sha256sums=('fffc8e0fc35055d45fb7e2e4bd87d42f9ef80b927bc66f8e812c1fc250996e7b')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
