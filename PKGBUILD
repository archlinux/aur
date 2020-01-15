# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-trackpy
pkgver=0.4.2
pkgrel=1
pkgdesc="Tools for particle tracking"
url="https://github.com/soft-matter/trackpy"
arch=(any)
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas' 'python-six' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-nose')
optdepends=("python-pims: simplifies image-reading"
            "python-pytables: saving results in an HDF5 file"
            "python-numba: for accelerated feature-finding and linking"
            "python-pillow: for some display routines")
source=(trackpy-"$pkgver".tar.gz::https://github.com/soft-matter/trackpy/archive/v$pkgver.tar.gz)
md5sums=('bb166d6d93c7b8f9a3330a9d758808eb')


build() {
    cd trackpy-"$pkgver"
    python setup.py build
}

check() {
    cd trackpy-"$pkgver"
    nosetests3
}

package() {
    cd trackpy-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
