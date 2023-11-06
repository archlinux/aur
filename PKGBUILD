# Maintainer: Lex Black <autumn-wind@web.de>

_module=vl-convert-python
pkgname=python-vl-convert
pkgver=1.0.1
pkgrel=1
pkgdesc="Convert Vega-Lite chart specifications to SVG, PNG, or Vega"
arch=(x86_64)
url="https://github.com/vega/vl-convert"
license=(BSD)
depends=(python)
makedepends=(python-maturin python-build python-installer python-wheel cmake)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('488565b6a0eb5e75558f82147217c5090672bee58745e79225b2f2902db9fffd')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
