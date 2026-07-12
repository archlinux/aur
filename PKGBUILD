# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.6.1
pkgrel=1
pkgdesc="Python library for reading and writing across lite crossword puzzle .puz files."
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
b2sums=('3c7ba268d1059d27728dfec04feec48035945177b83b64b7f48e37850e36c3af17a47662265c577bacd3531bf090a9a1e2fdb0be23728dee7c5315e4fd27792c')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
