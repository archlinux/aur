# Maintainer: Lex Black <autumn-wind@web.de>

_module=narwhals
pkgname=python-${_module}
pkgver=1.24.1
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
sha256sums=('b09b8253d945f23cdb683a84685abf3afb9f96114d89e9f35dc876e143f65007')


build() {
  cd "${_module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
