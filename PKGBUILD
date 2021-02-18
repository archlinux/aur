# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python-pyscf-git
_pkgname=python-pyscf
pkgver=1.7.6a1.r104.g09eca1f68
pkgrel=1
pkgdesc="Python-based Simulations of Chemistry Framework"
arch=(i686 x86_64)
url="http://pyscf.github.io"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun' 'libcint' 'libxc')
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
