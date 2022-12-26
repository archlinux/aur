# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-grilops
_name=${pkgname#python-}
pkgver=0.9.1
pkgrel=2
pkgdesc='GRId LOgic Puzzle Solver'
arch=(any)
url=https://github.com/obijywk/grilops
license=(custom:MIT)
depends=(python python-z3-solver)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('b078394eadcabe6aaef1fc3c6d1c9c341214c778a812364ea79f2e5904365d5b'
  '7161cd1ef6b37818a00e227eadcbf69472f89978754145f3904d1e6d53dfc282')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
