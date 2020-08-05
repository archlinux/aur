# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pamqp
_pkgname=pamqp
pkgver=3.0.0
pkgrel=1
pkgdesc="RabbitMQ Focused AMQP low-level library"
arch=("any")
url="https://github.com/gmr/pamqp"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('710085aa9ee8f1d6e4df21d3c9a8a20bd0187a6c6875f1bf6d912e8b2e480b74')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
