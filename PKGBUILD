# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.4.0
pkgrel=3
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://github.com/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-poetry" "python-installer")
optdepends=()
source=("https://github.com/rumpelsepp/oscclip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc0c02a91733c9fc4d10dbdc8aee5ea73a4be9b996ad1faa31ef3b083fda6c6d')

build() {
    cd "$pkgname-$pkgver"
	poetry build
}

package() {
    cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
