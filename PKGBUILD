# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=('python-scikit-umfpack')
pkgname=('python-scikit-umfpack' 'python2-scikit-umfpack')
_module='scikit-umfpack'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Python interface to UMFPACK sparse direct solver."
url="https://scikit-umfpack.github.io/scikit-umfpack"
depends=('atlas-lapack' 'suitesparse' 'python2-scipy' 'python-scipy' 'cython2' 'cython' 'python2-numpy' 'python-numpy')
makedepends=('python-setuptools' 'python2-setuptools' 'swig' 'python-pypandoc' 'python2-pypandoc')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/s/scikit-umfpack/scikit-umfpack-${pkgver}.tar.gz")
md5sums=('582d6a1b78576d1b6dc8c5f95635c24e')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

package_python-scikit-umfpack() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-scikit-umfpack() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
