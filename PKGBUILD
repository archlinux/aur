# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-trackpy
pkgver=0.2.4
pkgrel=4
pkgdesc="tools for particle tracking"
url="https://github.com/soft-matter/trackpy"
arch=(any)
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas' 'python-yaml' 'python-pims')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/soft-matter/trackpy/archive/v$pkgver.zip)

check() {
    cd $srcdir/trackpy-"$pkgver"
    nosetests3
}

package() {
    cd $srcdir/trackpy-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('2aa4e7c8c42473a5e0f4fd0de2bd5a11')
