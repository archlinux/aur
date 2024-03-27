# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-ollama
pkgver=0.1.8
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
b2sums=('9c7bfed393eb7424652514f6916ec00807520ecea5f367dd6b08bdbfa803426112990ce91051bc088249f9d6a3304d944407f17eb968715a9039aca891fb7126')
