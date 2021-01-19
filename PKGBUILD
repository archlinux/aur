# Maintainer: Lain Musgrove <lain.proliant@gmail.com>
pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='4.9.3'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('93c1e892badf0fb02504bfb88abe06dc80d58998e0b31f7f0088621332cd1d50')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
