# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-bqplot'
_pkgname='bqplot'
pkgver='0.12.39'
pkgrel=1
pkgdesc="Plotting library for IPython/Jupyter notebooks"
url="https://github.com/bloomberg/bqplot"
depends=('python'
    'python-ipywidgets'
    'python-numpy'
    'python-pandas'
    'python-traitlets')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('14d8de6f9a4d1945bbea6c1320ea4d1c93256f72683774f6e0020dcc579f3dd2')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
