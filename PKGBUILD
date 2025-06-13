# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.11.0
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – high-level python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/$pkgname#tag=v$pkgver")
sha256sums=('9463b1805bbe50dbc41452212bf7a67ed66ce8553ac6c2c36def43daff5ec07d')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  depends+=(cadet-core python-corner python-dill python-matplotlib python-numpy python-pandas
            python-pathos python-psutil python-pytest python-scipy)
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
