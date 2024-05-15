# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.2.0
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
	cd "ollama-python-$pkgver"
	poetry build -f wheel
}

package() {
	cd "ollama-python-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('52f75a82e7eed6bdcfd07d2b008a1b66ce11a90fbb9c2249342ff18a9fae721eff4525459de69397df499907aa912c28f5e53fcfced72707f8c9d878050e90bc')
