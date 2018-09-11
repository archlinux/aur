# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgbase=('python-ompython')
pkgname=('python-ompython')
_module='OMPython'
pkgver='3.1.0'
pkgrel=1
pkgdesc="OpenModelica-Python API Interface"
url="http://openmodelica.org/"
depends=('python' 'python-future')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/o/ompython/OMPython-${pkgver}.tar.gz")
md5sums=('fbeb864af4137eca522b47989c3c5e18')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
