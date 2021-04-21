# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-eduvpn-client
pkgver=2.0.0
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-setuptools')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4cef709f90eb574de6488cebc7a5b116634dc68bdd4e1145918b711c84a1433e')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
