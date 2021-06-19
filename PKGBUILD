pkgname=python-titlecase
_module='titlecase'
pkgver=2.2.0
pkgrel=1
pkgdesc="Python Port of John Gruber's titlecase.pl"
url="https://github.com/ppannuto/python-titlecase"
depends=('python' 'python-regex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/titlecase/titlecase-${pkgver}.tar.gz")
md5sums=('a59fb1a51596c6aacf983442ac5947aa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
