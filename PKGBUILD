# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=python-pymbolic
_module=pymbolic
pkgver=2022.1
pkgrel=1
pkgdesc="Pymbolic: A simple package to do symbolic math (focus on code gen and DSLs)"
url="https://github.com/inducer/pymbolic"
depends=('python-pytools' 'python-sympy' 'python-symengine')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/inducer/pymbolic/archive/v${pkgver}.tar.gz")
sha256sums=('d71db6ddde3131cbfa6feadc97659f7c3bbc65b5fda0fcd84dc34e12ba6e3cc0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
