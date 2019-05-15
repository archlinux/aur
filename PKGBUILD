# Maintainer: 71e6fd52 <71e6fd52@gmail.com>

pkgbase='python-aioamqp'
pkgname=('python-aioamqp')
_module='aioamqp'
pkgver='0.13.0'
pkgrel=1
pkgdesc="AMQP implementation using asyncio"
url="https://github.com/polyconseil/aioamqp"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ced0d2bb0054809b37b0636da34fc7cda23d66943fb5f9f0610555988cf347b2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
