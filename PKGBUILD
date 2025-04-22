# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Jeff M Hubbard <jeffmhubbard@gmail.com>
# Contributor: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=python-colormath2
pkgver=3.0.3
pkgrel=1
pkgdesc="Python module that abstracts common color math operations"
arch=('any')
url="https://github.com/bkmgit/python-colormath2"
license=('GPL3')
depends=(python-networkx python-numpy)
makedepends=(python-build python-installer python-wheel)
source=(colormath-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('b63e187113f161ce0bac86372f0cc6c5ef9e851adcdd515b1cfbede51cf90a22')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
