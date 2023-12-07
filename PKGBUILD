# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.1.16
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=('ollama' 'python' 'python-rich' 'python-typer' 'python-textual' 'python-pyperclip' 'python-httpx' 'python-aiosqlite' 'python-aiosql' 'python-packaging' 'python-dotenv' 'python-linkify-it-py')
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
b2sums=('a118edfc1c949eb78a6263278c1b0b88c7481b7949eb4fa581ad48c6cc1aa8f1e77daa5b3d200d5c66f0292782fdb82095a071b0e839729806171dd948ac9300')
