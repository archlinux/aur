# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.4.1
pkgrel=1
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://github.com/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-poetry" "python-installer")
optdepends=()
source=("https://github.com/rumpelsepp/oscclip/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('232bc7e67e4e0a615a7d9e312e245634b77758e814158714ee5d60a6c9fa05ac')

build() {
    cd "$pkgname-$pkgver"
	poetry build
}

package() {
    cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
