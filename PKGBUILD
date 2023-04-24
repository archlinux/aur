# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-cryptg
pkgver=0.4
pkgrel=1
pkgdesc="Cryptographic utilities for Telegram, designed to use with Telethon."
url="https://github.com/cher-nov/cryptg"
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'python-build' 'python-installer' 'python-wheel')
license=('CC0')
arch=('any')
source=("https://github.com/cher-nov/cryptg/archive/v${pkgver}.tar.gz")

sha256sums=('923a2318ab2e591952794d9b2125eb3f4fa4b5b9462fb2305ee9de8b092c49b3')

build() {
    cd "${srcdir}/cryptg-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/cryptg-${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
