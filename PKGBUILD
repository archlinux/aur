# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=oterm
pkgver=0.1.13
pkgrel=1
pkgdesc="A text-based terminal client for Ollama"
arch=('any')
url="https://github.com/ggozad/oterm"
license=('MIT')
depends=('ollama' 'python' 'python-rich' 'python-typer' 'python-textual' 'python-pyperclip' 'python-httpx' 'python-aiosqlite' 'python-aiosql' 'python-packaging' 'python-dotenv')
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
b2sums=('aed2e38b1bda9112e1d6d6135a426b3c17d393e6449504a18bc049bd090860e9338d6054d29031cf023773269880bc8af3d9dfea87f9f2aac9b99757d0462a0a')
