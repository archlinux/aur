# Maintainer: Lex Black <autumn-wind@web.de>

_module=narwhals
pkgname=python-${_module}
pkgver=1.14.3
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
sha256sums=('3a9484c69c36bbc44a28a36627eede502946e60d6e0401b4b351202b42b18419')


build() {
  cd "${_module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
