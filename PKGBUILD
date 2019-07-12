# Maintainer: peippo <christoph.fink@gmail.com>

pkgname='python-fasttext'
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=('python-fasttext')
conflicts=('python-fasttext')

pkgver=0.9.1
pkgrel=0

arch=('any')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('pybind11' 'python-future' 'python-numpy' 'python-scipy' 'python-pytorch')

source=("https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=("254ace2fc8dc3bea0fc6ad4897a221eb85c1e9adfa61d130b43398193ca1f061")

build() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
