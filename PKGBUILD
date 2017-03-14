pkgname=('python2-dill-fix')
_module='dill'
pkgver='0.2.6'
pkgrel=1
pkgdesc="serialize all of python - fix for python3 dep"
url="http://www.cacr.caltech.edu/~mmckerns/dill.htm"
depends=('python2')
provides=('python2-dill')
conflicts=('python2-dill')
optdepends=('python2-objgraph')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/d/dill/dill-${pkgver}.zip")
md5sums=('f8b98b15223d23431024349f2102b4f9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
