# Maintainer: Hao Long <aur@esd.cc>
# Contributor: 71e6fd52 <71e6fd52@gmail.com>

pkgname=python-aioamqp
_module=aioamqp
pkgver=0.14.0
pkgrel=1
pkgdesc="AMQP implementation using asyncio"
url="https://github.com/polyconseil/aioamqp"
depends=('python-pamqp')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('eef5c23a7fedee079d8326406f5c7a5725dfe36c359373da3499fffa16f79915')

build() {
    cd ${_module}-${pkgver}
    python setup.py build
}

package() {
    cd ${_module}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
