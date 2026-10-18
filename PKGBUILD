# Maintainer: Luis Martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701@ at mail dot com>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-globus-sdk
pkgver=4.9.1
pkgrel=1
pkgdesc="Pythonic interface to Globus APIs"
arch=(any)
url="https://github.com/globus/globus-sdk-python"
license=(Apache-2.0)
depends=(python python-cryptography python-six python-requests python-pyjwt python-typing_extensions)
makedepends=(git python-setuptools python-installer python-build)
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('163ffec079c5e01c51880675bbbfcac0743c01a9a5131a98ea1a3ea475ea7a92')
validpgpkeys=('FC694E40DC03A8B702D96372CF7E843C41E814C9')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
