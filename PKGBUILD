# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=python-rlottie-python
_name=rlottie_python
pkgver=1.3.8
pkgrel=1
pkgdesc='A ctypes API for rlottie, with additional functions for getting Pillow Image.'
arch=('any')
url="https://github.com/laggykiller/rlottie-python"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=('python-pillow: allow pillow related functions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a8404bc5e8fa9b4e5c7dad2173930c11450c9a2d95091f4f6a213bc77c4d9288')

build() {
    cd $_name-$pkgver
    python -m build --wheel
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}