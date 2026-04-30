# Maintainer: Matthias Schabhüttl <https://github.com/mschabhuettl>

pkgname=openconnect-saml
pkgver=0.16.0
pkgrel=1
pkgdesc="OpenConnect wrapper with Azure AD (SAML) SSO support for Cisco SSL-VPNs"
arch=('any')
url="https://github.com/mschabhuettl/openconnect-saml"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'openconnect'
    'python-attrs'
    'python-colorama'
    'python-keyring'
    'python-lxml'
    'python-prompt_toolkit'
    'python-pyotp'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-pysocks'
    'python-pyxdg'
    'python-requests'
    'python-structlog'
    'python-toml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mschabhuettl/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('336632173bf24216140a33fdd697963e3f9c4706095e68738838a33f12d7f649')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
