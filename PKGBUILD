# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=('python2-pyamg')
_module='pyamg'
pkgver='4.0.0'
pkgrel=1
pkgdesc="PyAMG: Algebraic Multigrid Solvers in Python"
url="https://github.com/pyamg/pyamg"
depends=('python2')
makedepends=('python2-setuptools' 'pybind11')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/p/pyamg/pyamg-${pkgver}.tar.gz")
sha256sums=('3ceb38ffd86e29774e759486f2961599c8ed847459c68727493cadeaf115a38a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

check() {
	cd "${srcdir}/${_module}-${pkgver}"
	python2 setup.py test
}


package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
