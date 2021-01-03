pkgbase='python-retype'
pkgname='python-retype'
_module='retype'
pkgver='20.10.0'
pkgrel=1
pkgdesc="Re-apply types from .pyi stub files to your codebase."
url="https://github.com/ambv/retype"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retype/retype-${pkgver}.tar.gz")
sha256sums=('80dd348414993486bc131ba7dcbb2a272dffb1473b96d51a6cf0185eff9e7c83')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
