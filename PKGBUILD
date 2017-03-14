pkgname=('python2-ppft-fix')
_module='ppft'
pkgver='1.6.4.7.1'
pkgrel=1
pkgdesc="distributed and parallel python - with deps fixed"
url="https://github.com/uqfoundation"
depends=('python2' 'python2-six')
optdepends=('python2-dill')
makedepends=('python2-setuptools')
provides=('python2-ppft')
conflicts=('python2-ppft')
license=('unknown')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/p/ppft/ppft-${pkgver}.zip")
md5sums=('2b196a03bfbc102773f849c6b21e617b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
