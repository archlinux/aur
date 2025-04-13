# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.11.0
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
	'python-mcp'
	'python-textual-image'
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
b2sums=('774e0f474550dca506d6586f80462a97cc8a7705400a176c692b5a31e725ffd4196b345f5e16cc4ba05f35382a2620e8a116b53e018448bb20ab2cca18187520')
