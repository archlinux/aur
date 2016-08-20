# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-trackpy
pkgver=0.3.2
pkgrel=1
pkgdesc="Tools for particle tracking"
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
md5sums=('45a4a07a5798a5bfa2742205e8c80860')
