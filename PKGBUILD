# Maintainer: Niklas Reimer <niklas at backbord dot net>
pkgname=python-titlecase
_module='titlecase'
pkgver=2.4.1
pkgrel=1
pkgdesc="Python Port of John Gruber's titlecase.pl"
url="https://github.com/ppannuto/python-titlecase"
depends=('python' 'python-regex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/titlecase/titlecase-${pkgver}.tar.gz")
md5sums=('f7b8a85bdd22e06b8a3b1cdbc0e5ddfc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
