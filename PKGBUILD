# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-bqplot'
_pkgname='bqplot'
pkgver='0.12.30'
pkgrel=1
pkgdesc="Plotting library for IPython/Jupyter notebooks"
url="https://github.com/bloomberg/bqplot"
depends=('python'
    'python-ipywidgets'
    'python-numpy'
    'python-pandas'
    'python-traitlets')
checkdepends=('python-pytest' 'python-traitlets')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e553440a5dfb2c92639b9d08852b9164d51c23776ab02d93785d62e2e5ee67de')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest tests 
}
