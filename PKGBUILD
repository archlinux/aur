# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=python-rlottie-python
_name=rlottie_python
pkgver=1.3.7
pkgrel=1
pkgdesc='A ctypes API for rlottie, with additional functions for getting Pillow Image.'
arch=('any')
url="https://github.com/laggykiller/rlottie-python"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=('python-pillow: allow pillow related functions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('fe184b1a3402060d4bbb59efd9c134524fa37f6c4cfca9eb633d628feace6733')

build() {
    cd $_name-$pkgver
    python -m build --wheel
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}