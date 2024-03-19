# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=xtb
pkgname=python-${_name,,}
pkgver=22.1
pkgrel=2
pkgdesc='Python API for the extended tight-binding program xtb'
arch=('any')
url="https://github.com/grimme-lab/xtb-python"
license=('LGPL3')
depends=('python>3.7' python-numpy python-cffi xtb)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7a59e7b783fc6e8b7328f55211de681e535a83991b07c4bab73494063f5e9018')

makedepends=(python-build python-installer python-wheel)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
