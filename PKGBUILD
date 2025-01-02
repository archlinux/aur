# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.7.1
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=(
	'python'
	'python-ollama'
	'python-rich'
	'python-typer'
	'python-textual'
	'python-pyperclip'
	'python-aiosqlite'
	'python-aiosql'
	'python-packaging'
	'python-dotenv'
	'python-linkify-it-py'
	'python-rich-pixels'
	'python-pillow'
	'python-textualeffects'
	'python-pydantic'
)
makedepends=(
	'python-installer'
	'uv'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ggozad/oterm/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver" || exit
	uvx --from build pyproject-build --installer uv
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('9c5fb40262f778213f83d549d8d6bbe8c9af3873ec9e96e99feca82e32b9605936fa127435a1bd3398a73bbcfbdb0373d681fd389e3c7450622b354a3b454f48')
