pkgbase=('python-retype')
pkgname=('python-retype')
_module='retype'
pkgver='17.12.0'
pkgrel=1
pkgdesc="Re-apply types from .pyi stub files to your codebase."
url="https://github.com/ambv/retype"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retype/retype-${pkgver}.tar.gz")
sha256sums=('b64b767befbe6f5fd918603ab7d6bbff07fc4c431bae2f471e195677a0c9b327')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
