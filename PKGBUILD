# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.14.5
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
b2sums=('6d4a9278cd14f2f7c160331f3ae2a6bbbac27c4dfaab61d2b186797f13a4b3c62332f8f00701525d9d720af26484fe8067a42cd26d50e1b9245dcea0f6b773ff')
