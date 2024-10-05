# Maintainer: Lex Black <autumn-wind@web.de>

_module=vl-convert-python
pkgname=python-vl-convert
pkgver=1.7.0
pkgrel=1
pkgdesc="Convert Vega-Lite chart specifications to SVG, PNG, or Vega"
arch=(x86_64)
url="https://github.com/vega/vl-convert"
license=(BSD)
depends=(python)
makedepends=(python-maturin python-build python-installer python-wheel cmake protobuf)
options=(!lto)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('bc9e1f8ca0d8d3b3789c66e37cd6a8cf0a83406427d5143133346c2b5004485b')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
