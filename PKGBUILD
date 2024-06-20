# Maintainer: Lex Black <autumn-wind@web.de>

_module=vl-convert-python
pkgname=python-vl-convert
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert Vega-Lite chart specifications to SVG, PNG, or Vega"
arch=(x86_64)
url="https://github.com/vega/vl-convert"
license=(BSD)
depends=(python)
makedepends=(python-maturin python-build python-installer python-wheel cmake protobuf)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('ba1e13a84f5a3d1af393d0d32aa19c4268db573d5f5c799bce8a5dc0468b1899')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
