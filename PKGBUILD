# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=python-apngasm-python
_name=apngasm_python
pkgver=1.3.2
pkgrel=1
pkgdesc='A nanobind python API for apngasm, a tool/library for APNG assembly & disassembly with compression support.'
arch=('any')
url="https://github.com/laggykiller/apngasm-python"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=(
    'python-pillow: allow pillow related functions'
    'python-numpy: allow pillow and numpy related functions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('d45fcad4e6f6a2fb6c5e6e689b87bf2c8fe56b63c37efe65b3bd3e134dfab95d')

build() {
    cd $_name-$pkgver
    python -m build --wheel
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}