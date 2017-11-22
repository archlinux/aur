# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-bqplot')
_pkgname='bqplot'
pkgver='0.10.1'
pkgrel=1
pkgdesc="Plotting library for IPython/Jupyter notebooks"
url="https://github.com/bloomberg/bqplot"
depends=('python'
    'python-ipywidgets'
    'python-numpy'
    'python-pandas'
    'python-traitlets')
checkdepends=()
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('974f05cc9e9fa5df87825bf72af07e76a5f93aa6a0fc3f74adb979756573cc8b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
