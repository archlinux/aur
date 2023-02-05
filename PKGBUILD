pkgbase='python-recoverpy'
pkgname=('python-recoverpy')
_module='recoverpy'
pkgver='2.0.0'
pkgrel=1
pkgdesc="A TUI to recover overwritten or deleted data."
url="https://github.com/PabloLec/recoverpy"
depends=('python')
makedepends=('python-setuptools')
license=(GNU GPLv3)
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('10ff1868223ed6590c8801b2010705323dfcb37932f6e7ddde1ba79215bf7782')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
