# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname='python-pyscf'
pkgver=1.4.2
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/sunqm/pyscf"
source=("https://github.com/sunqm/pyscf/archive/v${pkgver}.tar.gz")
md5sums=('1e75068dd0d050dcfae4a7316b0851e3')
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py')
makedepends=('cmake')

build() {
    cd ${srcdir}/pyscf-${pkgver}/pyscf/lib
    mkdir build && cd build && cmake .. && make
}

package() {
    cd ${srcdir}/pyscf-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1   
}

