# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.2.6
pkgrel=2
pkgdesc="Python library for reading and writing across lite crossword puzzle .puz files."
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
b2sums=('ea6167fed5732b801bf0418d2e317fe3d8e7118705ae2568b68a178d05c0f75c28628950c4ade0937139293a357b3bf29e35cde629577c37afd2803a60bdb9f4')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
