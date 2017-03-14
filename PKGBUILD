pkgname=('python2-rpyc-fix')
_module='rpyc'
pkgver='3.3.0'
pkgrel=1
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library - fix for python2"
url="http://rpyc.readthedocs.org"
depends=('python2' 'python2-plumbum')
makedepends=('python2-setuptools')
provides=('python2-rpyc')
conflicts=('python2-rpyc')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rpyc/rpyc-${pkgver}.tar.gz")
md5sums=('6931cb92c41f547591b525142ccaeef1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
