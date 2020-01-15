# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=pims
pkgname=python-pims
pkgver=0.4.1
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
source=(${_name}-${pkgver}.tar.gz::https://github.com/soft-matter/${_name}/archive/v$pkgver.tar.gz)
md5sums=('b221a61c48c530d173ce37e3134da754')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    nosetests3
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
