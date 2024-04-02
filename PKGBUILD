# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.2.5
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
b2sums=('c25f01456c6ce5c3f0e7363b3691694efa037d1ec2ed42b782e026e0bb001c6ace2bd428da0ace3a772f2b50c2993689622cf2c3e187a85662acd95120979f65')
