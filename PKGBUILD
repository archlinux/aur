pkgbase='python-fbprophet'
pkgname=('python-fbprophet')
_module='fbprophet'
pkgver='0.5'
pkgrel=1
pkgdesc="Automatic Forecasting Procedure"
url="https://facebook.github.io/prophet/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c67fde2845db52dbdb4becd312b271575ce1c804be666ed1eee94339c5a35127')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
