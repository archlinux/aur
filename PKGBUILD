# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-bqplot'
_pkgname='bqplot'
pkgver='0.12.40'
pkgrel=1
pkgdesc="Plotting library for IPython/Jupyter notebooks"
url="https://github.com/bloomberg/bqplot"
depends=('python'
    'python-ipywidgets'
    'python-numpy'
    'python-pandas'
    'python-traitlets')
makedepends=('python-setuptools' 'python-jupyter-packaging')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ecbfe8bf04f04458eee46dc2c2f8256b4c1521d46f94438e9be19389e4f86fb9')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
