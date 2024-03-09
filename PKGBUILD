# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=monero-api-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="Python cli application meant for remotely interacting with a Monero Daemon via its RPC API"
arch=('any')
url="https://github.com/Dvd-Znf/monero-api-cli/"
license=('MIT')
depends=("python" "python-requests" "python-prompt_toolkit")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
#checkdepends=()
#optdepends=()
source=("https://github.com/Dvd-Znf/monero-api-cli/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("5f413245815255ad1109d0e88e90599ffed6b14d10d33e73b3ad448b624f1542")

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
