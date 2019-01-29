# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python2-pyscf
pkgver=1.6.0
pkgrel=1
pkgdesc="Python-based Simulations of Chemistry Framework"
arch=(i686 x86_64)
url="http://sunqm.github.io/pyscf"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-h5py' 'xcfun-pyscf' 'libcint-cint3' 'libxc')
makedepends=('cmake')
provides=($pkgname=$pkgver)
conflicts=(${pkgname}-git)
_name=${pkgname#python2-}
source=("https://github.com/pyscf/pyscf/archive/v$pkgver.tar.gz")
sha256sums=('b6f48fa7da3ef8fca2e78f0a145b595c232ac82001095c097e49c97ce89422d7')

build() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
