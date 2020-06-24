# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jia Li <lijia1608@gmail.com>

pkgname=python2-pyscf
pkgver=1.7.3
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
sha256sums=('6e4a905a9af9c2ffb457a35a1ee2bef93e079d9bb34a0aa09d0963fc70e2a350')

build() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    PYSCF_INC_DIR=/usr python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
