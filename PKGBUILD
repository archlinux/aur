# Maintainer: Lain Musgrove <lain.proliant@gmail.com>
pkgbase='python-xeno'
pkgname=('python-xeno')
_module='xeno'
pkgver='4.9.4'
pkgrel=1
pkgdesc="The Python dependency injector from outer space."
url="https://github.com/lainproliant/xeno"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5792a378bd059ced7fdbe6feea7e076786b8f8a42d8d691ed67ab68af892d4bb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
