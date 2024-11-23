# Maintainer: Dvd-Znf <email@dvdznf.xyz>
pkgname=monero-api-cli
pkgver=0.2.1
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
sha256sums=("a0bbb6817c55cdd93bc1d322d7c90b77a846e9527a3b4c340f7f6daafe76bab0")

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
