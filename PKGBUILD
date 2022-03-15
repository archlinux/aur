# Maintainer: Jose Riha <jose1711 gmail com>

pkgbase='python-msgcheck'
pkgname=('python-msgcheck')
_module='msgcheck'
pkgver=4.0.0
pkgrel=1
pkgdesc="Gettext file checker."
url="https://github.com/flashcode/msgcheck"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('28ae4485ed2c46145c492e50e93536325eb56c8fad0e3c8edefe2cf3d54f6aee')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
