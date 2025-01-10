# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=python-rlottie-python
_name=rlottie_python
pkgver=1.3.6
pkgrel=1
pkgdesc='A ctypes API for rlottie, with additional functions for getting Pillow Image.'
arch=('any')
url="https://github.com/laggykiller/rlottie-python"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel)
optdepends=('python-pillow: allow pillow related functions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('56ecc192adec3c7184897dbf3134dfa79aea7f59c8bfc2da97d2c8043050ac04')

build() {
    cd $_name-$pkgver
    python -m build --wheel
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}