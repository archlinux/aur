# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastparquet')
_module='fastparquet'
pkgver='0.0.5'
pkgrel=1
pkgdesc="A python implementation of the parquet format."
url="https://github.com/dask/fastparquet"
checkdepends=('python-pytest')
depends=('cython'
    'python'
    'python-numba'
    'python-numpy'
    'python-pytest'
    'python-thriftpy')
makedepends=('python-setuptools')
optdepends=('python-snappy')
license=('Apache')
arch=('i686' 'x86_64')
source=("https://github.com/dask/fastparquet/archive/$pkgver.tar.gz")
sha256sums=('b8091a38ffa5ed16ddd98ef96ea3561a182b2b23a3060118cdd2beeec16db798')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
