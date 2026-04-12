# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.6.0
pkgrel=1
pkgdesc="Python library for reading and writing across lite crossword puzzle .puz files."
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-${pkgver}.tar.gz)
b2sums=('98ffe782975b1e51930bbc5fa19f3bd11c4dca49bff6fa751ec5acd4e6b09d6eefaab5dade25619591d0220bca7c3d3ab0ff5dc65e28fd0f40b96a05c5f000ad')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
