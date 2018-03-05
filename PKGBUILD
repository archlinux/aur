# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgbase=('python-ompython')
pkgname=('python-ompython')
_module='OMPython'
pkgver='3.0.2'
pkgrel=1
pkgdesc="OpenModelica-Python API Interface"
url="http://openmodelica.org/"
depends=('python' 'python-future')
makedepends=('python-setuptools')
optdepends=('python-pyzmq')
license=('OSMC-PL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/o/ompython/OMPython-${pkgver}.tar.gz")
md5sums=('2931024d24c0bd43d739a0c9ba2f2f1a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
