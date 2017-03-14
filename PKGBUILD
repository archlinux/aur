pkgname=('python2-pyina')
_module='pyina'
pkgver='0.1a1'
pkgrel=1
pkgdesc="MPI parallel map and cluster scheduling"
url="http://www.cacr.caltech.edu/~mmckerns/pyina.htm"
depends=('python2' 'python2-dill' 'python2-mpi4py')
#optdepends=('python2-pyre')
makedepends=('python2-setuptools')
provides=('python2-pyina')
conflics=('python2-pyina-git')
license=('BSD')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/p/pyina/pyina-${pkgver}.tgz")
md5sums=('e6c3c09d6b86f0a47246348680e35fbf')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
