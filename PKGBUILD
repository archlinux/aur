# Maintainer: Lex Black <autumn-wind@web.de>

_module=narwhals
pkgname=python-${_module}
pkgver=1.13.3
pkgrel=1
pkgdesc="Extremely lightweight compatibility layer between dataframe libraries"
arch=(any)
url="https://github.com/narwhals-dev/narwhals"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('python-pandas: for Pandas support'
            'python-polars: for Polars support'
            'python-pyarrow: for PyArrows support')
source=(https://github.com/narwhals-dev/narwhals/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz)
sha256sums=('db95cb5b5a6b99bad9fe7f2e2dacf937d57dee1c76c4544d4354a324084e36b5')


build() {
  cd "${_module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
