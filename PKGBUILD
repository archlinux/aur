# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=2.2.1
pkgrel=2
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject' 'hicolor-icon-theme' 'python-wheel')
makedepends=('python-build' 'python-installer')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d359bb93ba65a617a99bee4c34c803cdd6c66df63348a03544c4e5f50d48b2b4')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
