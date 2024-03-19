# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-client"
_name=${pkgname#python-}
pkgver="24.02.1"
pkgrel=2
pkgdesc="Client library and plugin library for Core Lightning"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-client"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-bolt7" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("733e2b41411a5882d93319883f8575e6959fe33a30e4f0de589ce7e4511a512b")

build() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-client"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-client"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
