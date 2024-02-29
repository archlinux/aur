# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.2.3
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
b2sums=('bd22d1538f8eb971dd6c6dda5296b3f3e1325d2a9e43acd34289e54cb423a072052a441b0593d2ec9a1137eb27ec144c1fb461aab855429ed49916a2c63df8a1')
