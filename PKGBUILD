pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='7.4.0'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c2d7461678b79a3c89b5a079bde307623ed7ddad793305bfbdfa36e01757dab9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}