# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-flask-humanize
_module='Flask-Humanize'
pkgver=0.3.0
pkgrel=2
pkgdesc="Common humanization utilities for Flask applications."
url="https://github.com/vitalk/flask-humanize"
depends=('python' 'python-humanize')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f65a7b4cfcdeee1b1987f40af0f0e10f99f95423bf04e04720e7c086ea9f3d49')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
