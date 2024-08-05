# Maintainer: Lex Black <autumn-wind@web.de>

_module=vl-convert-python
pkgname=python-vl-convert
pkgver=1.6.0
pkgrel=1
pkgdesc="Convert Vega-Lite chart specifications to SVG, PNG, or Vega"
arch=(x86_64)
url="https://github.com/vega/vl-convert"
license=(BSD)
depends=(python)
makedepends=(python-maturin python-build python-installer python-wheel cmake protobuf)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz)
sha256sums=('f7539c5558026d41d870df3ea92546ef87956c7b62ca99426906e941115bfd41')


build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
