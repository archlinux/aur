# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python-pyscf-git
_pkgname=python-pyscf
pkgver=1.6.3.r0.g3f66df27
pkgrel=1
pkgdesc="Python-based Simulations of Chemistry Framework"
arch=(i686 x86_64)
url="http://pyscf.github.io"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun-pyscf' 'libcint-cint3' 'libxc3')
makedepends=('cmake')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/pyscf/pyscf.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    PYSCF_INC_DIR=/usr python setup.py install --root="$pkgdir/" --optimize=1
}
