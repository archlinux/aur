pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='7.1.1'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('85d80811453e7a53afc1a077cb669d2ec5e53aee023a9f5bfd9b354a71b5496f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
