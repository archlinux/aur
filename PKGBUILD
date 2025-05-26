# Maintainer: lesebas <sebastiendotdelignyatgmail.com>

pkgname=python-hurry-filesize
_name=hurry.filesize
pkgver=0.9
pkgrel=9
pkgdesc="A simple Python library for human readable file sizes (or anything sized in bytes)."
arch=('any')
url="http://pypi.python.org/pypi/hurry.filesize/"
license=('GPL')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
md5sums=(8549ccd09bb31b5ff1e8e8c1eacc7794)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

