# Maintainer: peippo <christoph.fink@gmail.com>

pkgname='python-fasttext'
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=('python-fasttext')
conflicts=('python-fasttext')

pkgver=0.2.0
pkgrel=1

arch=('any')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('pybind11' 'python-future' 'python-numpy' 'python-scipy' 'python-pytorch')

source=("https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=('71d24ffec9fcc4364554ecac2b3308d834178c903d16d090aa6be9ea6b8e480c')

build() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
