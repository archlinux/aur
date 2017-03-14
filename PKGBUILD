pkgname=('python2-mystic')
_module='mystic'
pkgver='0.3.0'
pkgrel=1
pkgdesc="highly-constrained non-convex optimization and uncertainty quantification"
url="http://www.cacr.caltech.edu/~mmckerns"
depends=('python2')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/m/mystic/mystic-${pkgver}.tgz")
md5sums=('a3645b7dd55c405fc24195dd21289293')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
