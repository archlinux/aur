pkgbase='python-retype'
pkgname='python-retype'
_module='retype'
pkgver='22.8.0'
pkgrel=1
pkgdesc="Re-apply types from .pyi stub files to your codebase."
url="https://github.com/ambv/retype"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retype/retype-${pkgver}.tar.gz")
sha256sums=('4439b553c509741f3d08542decdde63365556dced1f4390eae0e22738d839fd9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
