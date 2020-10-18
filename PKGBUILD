# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=('python-ompython')
_name=OMPython
pkgver='3.1.2'
pkgrel=2
pkgdesc="OpenModelica-Python API Interface"
url="http://openmodelica.org/"
depends=('python' 'python-future')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('8f6484200cfecb2e7b0737300f963fd5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
