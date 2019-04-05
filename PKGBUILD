# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python2-pyscf
pkgver=1.6.1
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
sha256sums=('60ea5e82a3061466a423dd44650664e9b4594e88c7b880d66749e0b2901f1e2a')

build() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
