# Maintainer: Hao Long <aur@esd.cc>
# Contributor: 71e6fd52 <71e6fd52@gmail.com>

pkgname=python-aioamqp
_module=aioamqp
pkgver=0.15.0
pkgrel=1
pkgdesc="AMQP implementation using asyncio"
url="https://github.com/polyconseil/aioamqp"
depends=('python-pamqp')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('aef4651a2f8eafd79e7cc61c45be1e8c63c1437a90f2202832883e6015f7a2a8bf964eeda794230aa11db58078f8ba5e3d27eabba94cb4f9d382cdca349e0882')

build() {
    cd ${_module}-${pkgver}
    python setup.py build
}

package() {
    cd ${_module}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
