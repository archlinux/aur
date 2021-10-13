pkgbase='python-retype'
pkgname='python-retype'
_module='retype'
pkgver='21.10.0'
pkgrel=1
pkgdesc="Re-apply types from .pyi stub files to your codebase."
url="https://github.com/ambv/retype"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/retype/retype-${pkgver}.tar.gz")
sha256sums=('54b9220c9755897f15ead82e4a9a3923dc1a859482c792ca338da14d3ffedec2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
