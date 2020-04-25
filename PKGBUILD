# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname=python-pyscf
_name=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("https://github.com/pyscf/pyscf/archive/v${pkgver}.tar.gz")
sha256sums=('23ccf6d8bb6a15fe7035e04e6ab00783a069bf38556873c71a6fb672b6159636')
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun-pyscf' 'libcint' 'libxc3')
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
