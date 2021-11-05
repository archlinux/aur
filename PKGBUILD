# Maintainer: Jose Riha <jose1711 gmail com>
# Co-contributor: Andrea Pascal <andrea@anodium.net>

pkgname=python-pygatt
_module=pygatt
pkgver=4.0.3
pkgrel=3
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
depends=('python-enum-compat' 'python-pexpect' 'python-pyserial')
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b1db8e294fc9c68f4dee66e7e2bdde3240c18c2495237059b83f3e7ca9897466')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py check -m -s
}

package_python-pygatt() {

    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
