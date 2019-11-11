# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-bqplot')
_pkgname='bqplot'
pkgver='0.12.0'
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
sha256sums=('4b780edd67e2e76ba18ecaad1dcc53322dff4badd75cb012815b3d21aa33b44f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
