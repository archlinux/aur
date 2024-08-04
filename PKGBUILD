# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.3.1
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
b2sums=('432eb4c144c69eebf0b3a736a9f5423181008b22c8dc891033565f7c0555c326958fb851c40953f73d25bd07cc28ebcdd4a331a404984ca073f453cf1cb9133d')
