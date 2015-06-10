# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-trackpy
pkgver=0.2.4
pkgrel=2
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
md5sums=('d5327b79365e808eb85f7aafec37c523')
