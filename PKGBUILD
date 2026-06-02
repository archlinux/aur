# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-bqplot'
_pkgname='bqplot'
pkgver='0.13.1'
pkgrel=1
pkgdesc="Plotting library for IPython/Jupyter notebooks"
url="https://github.com/bloomberg/bqplot"
depends=(
    python
    python-ipywidgets
    python-numpy
    python-pandas
    python-traitlets
    python-traittypes
)
makedepends=('python-setuptools' 'python-jupyter-packaging')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('dd1f55c9bf971b1c3edf571a23edecd707aab5a72c3f5dac3cb98ee233fc6216')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
