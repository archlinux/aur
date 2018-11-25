# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=('python-pymbolic')
_module='pymbolic'
pkgver='2017.1'
pkgrel=1
pkgdesc="Pymbolic: A simple package to do symbolic math (focus on code gen and DSLs)"
url="https://github.com/inducer/pymbolic"
depends=('python' 'python-sympy' 'python-symengine')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/inducer/pymbolic/archive/v${pkgver}.tar.gz")
sha256sums=('91a1920efc93ef325da3b016ee76fb3bbb5aea5b12562a4e8d3e86d0449eca3e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py test
}


package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
