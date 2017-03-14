pkgname=('python2-pathos-3fix')
_module='pathos'
pkgver='0.2.0'
pkgrel=1
pkgdesc="parallel graph management and execution in heterogeneous computing fixed package - fixed deps"
url="http://www.cacr.caltech.edu/~mmckerns/pathos.htm"
depends=('python2' 'python2-dill' 'python2-pox' 'python2-ppft-fix' 'python2-multiprocess-fix')
optdepends=('python2-pyina-git' 'python2-rpyc')
provides=('python2-pythos')
conflicts=('python2-pathos')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pathos/pathos-${pkgver}.tgz")
md5sums=('3e75bd626c4c16a60aa78d9f35de6cfb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
