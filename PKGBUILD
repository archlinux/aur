# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.0.0
pkgrel=1
pkgdesc='Extendable Pentesting Framework '
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("apache")
depends=("python" "python-aiofiles" "python-aiosqlite" "python-argcomplete" "python-zstandard" "python-can" "python-tabulate" "python-pyxcp")
makedepends=("python-poetry" "python-installer" "git")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd4a0d8b7de2766a777f40c7f25ba73b0012308e10d494cb2fff93dd3397666e')

build() {
    cd "$pkgname-$pkgver"
	poetry build
}

package() {
    cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
