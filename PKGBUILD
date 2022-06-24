# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=3.1.0
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject' 'hicolor-icon-theme' 'python-wheel')
makedepends=('python-build' 'python-installer')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('252557ceae38b4a05aad0ffbe9f381bedbebed895007a7c018794dedc561142f')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
