# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-outdated
_module='outdated'
pkgver=0.2.0
pkgrel=1
pkgdesc="Check if a version of a PyPI package is outdated"
url="https://github.com/alexmojaki/outdated"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('bcb145e0e372ba467e998c327d3d1ba72a134b0d5a729749729df6c6244ce643')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
