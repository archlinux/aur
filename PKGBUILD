# Maintainer: Jose Riha <jose1711 gmail com>
# Co-contributor: Andrea Pascal <andrea@anodium.net>

pkgname=python-pygatt
_module=pygatt
pkgver=4.0.5
pkgrel=2
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
depends=('python-pexpect' 'python-pyserial')
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7f4e0ec72f03533a3ef5fdd532f08d30ab7149213495e531d0f6580e9fcb1a7d')

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
