# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-eduvpn-client
pkgver=2.2.0
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject' 'hicolor-icon-theme' 'python-wheel')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cec8cf776221a1723a92d657f8a0911d20dce5ce3f74cb255fd3f3fae554b899')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
