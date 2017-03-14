pkgname=('python2-klepto')
_module='klepto'
pkgver='0.1.3'
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
url="http://www.cacr.caltech.edu/~mmckerns/klepto.htm"
depends=('python2' 'python2-pox')
optdepends=('python2-sqlalchemy')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/k/klepto/klepto-${pkgver}.zip")
md5sums=('e8a55a2d9aa38d77192cd456022cb388')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
