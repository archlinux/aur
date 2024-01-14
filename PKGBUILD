# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.1.20
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=(
	'ollama'
	'python'
	'python-rich'
	'python-typer'
	'python-textual'
	'python-pyperclip'
	'python-httpx'
	'python-aiosqlite'
	'python-aiosql'
	'python-packaging'
	'python-dotenv'
	'python-linkify-it-py'
	'python-rich-pixels'
	'python-pillow'
)
makedepends=('python-poetry')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ggozad/oterm/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	poetry build -f wheel
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('5a2a7dd1ba14b9ce085fa100e1a54812dec07d2fab19224b3a2dd882054194cb57bcf7784b5bc29604553904a4877e3aebe709ac95793e1f6226bd2212e6bb0d')
