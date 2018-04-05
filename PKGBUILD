# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python2-pyscf-git
_pkgname=python2-pyscf
pkgver=1.4.5.r10.g57c8912d
pkgrel=1
pkgdesc="Python-based Simulations of Chemistry Framework"
arch=(i686 x86_64)
url="http://sunqm.github.io/pyscf"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-h5py' 'xcfun' 'libcint' 'libxc')
makedepends=('cmake')
provides=($_pkgname=$pkgver)
conflicts=('python2-pyscf')
source=("$pkgname::git+https://github.com/sunqm/pyscf.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    PYSCF_INC_DIR=/usr/lib python2 setup.py install --root="$pkgdir/" --optimize=1
}
