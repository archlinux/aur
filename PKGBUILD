# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.3.3
pkgrel=1
pkgdesc="Ollama Python library"
arch=('any')
url="https://github.com/ollama/ollama-python"
license=('MIT')
depends=(
	'ollama'
	'python'
	'python-httpx'
	'python-typing_extensions'
)
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ollama/ollama-python/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "ollama-python-$pkgver" || exit
	poetry build -f wheel
}

package() {
	cd "ollama-python-$pkgver" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('24858cda01ecd8aeab8d34e2b5dff6013edfa7c8e245da79ac67d0d13c5ae5b9c1601775569e82f15360e4e7a8e6a5e5098ebd25ab600831988f37252f09bd7c')
