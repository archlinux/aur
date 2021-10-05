# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-eduvpn-client
pkgver=2.1.0
pkgrel=2
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject' 'hicolor-icon-theme' 'python-wheel')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('84753fe0cb407824138d97b412cb057c382128fe90111586bb2afbc4f505a05b')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
