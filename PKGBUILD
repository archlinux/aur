# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname='python-pyscf'
_name=${pkgname#python-}
pkgver=1.5.3
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/sunqm/pyscf"
source=("https://github.com/sunqm/pyscf/archive/v${pkgver}.tar.gz")
sha256sums=('962ff57502f1cc9326bba0d8c9d8e88e42cc992b70dcac62da23435de51e1b5e')
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun-pyscf' 'libcint-cint3' 'libxc')
makedepends=('cmake')
conflicts=(${pkgname}-git)

build() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
