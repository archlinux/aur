# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname='python-pyscf'
_name=${pkgname#python-}
pkgver=1.6.3
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("https://github.com/pyscf/pyscf/archive/v${pkgver}.tar.gz")
sha256sums=('469781b4f2975b1bda0c1b71157d8388cdc5470bec4f6619d12756826d1d7c54')
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun-pyscf' 'libcint-cint3' 'libxc3')
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
