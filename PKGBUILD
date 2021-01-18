# Maintainer: Lain Musgrove <lain.proliant@gmail.com>
pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='4.9.1'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('34e3e39d221b7331877cbe614d9fc14c4c124ee07a43da9355e73adba7dde41b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
