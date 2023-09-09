pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='7.0.0'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6161bc6f31ade0d2cfc7100890c8e76edf00626121665ea43877506cd96eca4e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
