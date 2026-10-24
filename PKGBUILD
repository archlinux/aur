# Maintainer: Luis Martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701@ at mail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-globus-sdk
pkgver=4.10.0
pkgrel=1
pkgdesc="Pythonic interface to Globus APIs"
arch=(any)
url="https://github.com/globus/globus-sdk-python"
license=(Apache-2.0)
depends=(python python-cryptography python-six python-requests python-pyjwt python-typing_extensions)
makedepends=(git python-setuptools python-installer python-build)
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('c0695185db501b33accee9be9c856bc93ccab8ca6b6fc67c6dab9879f527f9c1')
validpgpkeys=('FC694E40DC03A8B702D96372CF7E843C41E814C9'
              '24D9B0C8991CFA608CBF7B82EC368B90919BB3C7')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
