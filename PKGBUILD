# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-pims
pkgver=0.3.3
pkgrel=1
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=(any)
license=('BSD')
depends=('python' 'python-slicerator')
optdepends=('python-pillow: improved TIFF support'
            'python-tifffile: alternative TIFF support')
makedepends=('python-setuptools' 'python-scipy' 'python-matplotlib' 'python-scikit-image')
checkdepends=('python-nose')
source=(https://github.com/soft-matter/pims/archive/v$pkgver.zip)


check() {
    cd $srcdir/pims-"$pkgver"
    nosetests3
}

package() {
    cd $srcdir/pims-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('0cc4c4b185cd9c1db51054b3982aa140')
