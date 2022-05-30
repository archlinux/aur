# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gallia
pkgver=1.0.0alpha6
pkgrel=1
pkgdesc='Extendable Pentesting Framework '
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("apache")
depends=("python" "python-aiofiles" "python-aiosqlite" "python-argcomplete" "python-zstandard" "python-can" "python-tabulate")
makedepends=("python-poetry" "python-installer")
optdepends=("penlog: Reading logfiles with the hr tool")
source=("https://github.com/Fraunhofer-AISEC/gallia/archive/refs/tags/v${pkgver/alpha/-alpha}.tar.gz")
sha256sums=('387ce9d71c346ae0048e7008bc2d986f1d059c5f0f60fce124b9a3d5edcae8a1')

build() {
    cd "$pkgname-${pkgver/alpha/-alpha}"
	poetry build
}

package() {
    cd "$pkgname-${pkgver/alpha/-alpha}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
