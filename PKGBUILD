# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname=python-pyscf
_name=${pkgname#python-}
pkgver=1.7.4
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("https://github.com/pyscf/pyscf/archive/v${pkgver}.tar.gz")
sha256sums=('0fe0c56526109fde9b1233fe8997d0c17d988e9e62c4c2f3a2467e412f66e1dc')
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
