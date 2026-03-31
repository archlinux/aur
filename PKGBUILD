# Maintainer: Matthias Schabhüttl <https://github.com/mschabhuettl>

pkgname=openconnect-saml
pkgver=0.6.0
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
sha256sums=('8bdef853820e671f146e56402c506e0e66aa0006bad7345ffe78b8537976dd45')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
