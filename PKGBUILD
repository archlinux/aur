# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname='python-defopt'
_module='defopt'
pkgver='6.0.2'
pkgrel=1
pkgdesc="Effortless argument parser"
url="https://github.com/anntzer/defopt"
depends=('python' 'python-sphinxcontrib-napoleon')
makedepends=('python-setuptools' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e2573d063627d135e5a6773407b7e4525fdd10618a62d8ba1458616172718c38')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
