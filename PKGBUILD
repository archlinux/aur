# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-trackpy
pkgver=0.2.4
pkgrel=3
pkgdesc="tools for particle tracking"
url="https://github.com/soft-matter/trackpy"
arch=(any)
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-pandas' 'python2-yaml' 'python2-pims')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(https://github.com/soft-matter/trackpy/archive/v$pkgver.zip)

check() {
    cd $srcdir/trackpy-"$pkgver"
    nosetests2
}

package() {
    cd $srcdir/trackpy-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('845a05642ffe0305e22daa3805d24435')
