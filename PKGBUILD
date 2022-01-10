# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-ompython'
_name=OMPython
pkgver='3.3.0'
pkgrel=1
pkgdesc="OpenModelica-Python API Interface"
url="http://openmodelica.org/"
depends=('python' 'python-future' 'openmodelica-omc')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('e9d8ae1a8dc20b64cf52933cb39cc856')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
