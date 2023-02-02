# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname='python-pysimpleguiqt'
_module='PySimpleGUIQt'
pkgver='0.35.0'
pkgrel=1
pkgdesc="The Alpha Qt version of PySimpleGUI"
url="https://github.com/PySimpleGUI/PySimpleGUI"
depends=('pyside2')
makedepends=('python-setuptools')
license=('LGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2c18ea261554235a2cdaee76e616d0adc148501e89bf4112a798f2a69bf3c8b5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
