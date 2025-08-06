# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-client"
_name=${pkgname#python-}
pkgver="25.05"
pkgrel=1
pkgdesc="Client library and plugin library for Core Lightning"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-client"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-bolt7" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("00d633a63570f6419db0dbd75b503bb04ba0f6eb469894da6fced2a8949d8007")

build() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-client"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-client"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
