# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.12.0
pkgrel=1
pkgdesc='Modeling and simulation framework for biotech processes – high-level python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/$pkgname#tag=v$pkgver")
sha256sums=('1225989e768ab4874573cbdbacf6f6d93e2fc5a87eb3fbed57de652b4e6abe62')

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
