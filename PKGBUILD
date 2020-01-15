# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=pims
pkgname=python2-pims
pkgver=0.4.1
pkgrel=2
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=(any)
license=('BSD')
depends=('python2-six' 'python2-slicerator' 'python2-numpy')
optdepends=('python2-pillow: improved TIFF support'
            'python2-tifffile: alternative TIFF support')
makedepends=('python2-setuptools' 'python2-scipy' 'python2-matplotlib' 'python2-scikit-image')
checkdepends=('python2-nose')
source=(${_name}-${pkgver}.tar.gz::https://github.com/soft-matter/${_name}/archive/v$pkgver.tar.gz)
md5sums=('b221a61c48c530d173ce37e3134da754')


build() {
    cd "$_name-$pkgver"
    python2 setup.py build
}

check() {
    cd "$_name-$pkgver"
    nosetests2
}

package() {
    cd "$_name-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
