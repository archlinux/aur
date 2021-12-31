pkgbase='python-retype'
pkgname='python-retype'
_module='retype'
pkgver='21.12.0'
pkgrel=1
pkgdesc="Re-apply types from .pyi stub files to your codebase."
url="https://github.com/ambv/retype"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retype/retype-${pkgver}.tar.gz")
sha256sums=('976fded331eea4797f0bfec4ccb1311a78731ec28e07ba330be3db1f4ddd9407')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
