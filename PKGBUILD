# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.14.6
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=(
	'python'
	'python-httpx'
	'python-ollama'
	'python-rich'
	'python-rich-pixels'
	'python-typer'
	'python-textual'
	'python-textual-image'
	'python-textualeffects'
	'python-exceptiongroup'
	'python-pyperclip'
	'python-aiosqlite'
	'python-aiosql'
	'python-packaging'
	'python-dotenv'
	'python-linkify-it-py'
	'python-pillow'
	'python-pydantic'
	'python-mcp'
	'python-fastmcp'
)

depends=(python-textual-image python-pydantic python-ollama oterm python-fastmcp python-rich python-typer python-mcp python-pillow python-textual python python-packaging python-httpx python-textualeffects python-dotenv python-aiosqlite)

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
b2sums=('b3f9c54b6d6f290bcd0a24d58a6d3c96756d79005667312551ae53e5e2aa5634e17c333e5c2e39000c22552b64cfaae199f09c0808244beb4ae671932e416213')
