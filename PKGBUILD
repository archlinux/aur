pkgname=('python2-multiprocess-fix')
_module='multiprocess'
pkgver='0.70.5'
pkgrel=1
pkgdesc="better multiprocessing and multithreading in python - with fixed deps"
url="http://github.com/uqfoundation"
depends=('python2')
optdepends=('python2-dill')
provides=('python2-multiprocess')
conflicts=('python2-multiprocess')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/multiprocess/multiprocess-${pkgver}.zip")
md5sums=('bfe394368b1d98192f1f62cc0060be20')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
