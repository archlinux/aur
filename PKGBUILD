# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-textualeffects
_pkgname=textualeffects
pkgver=0.1.3
pkgrel=3
pkgdesc="Visual effects for Textual, a TermincalTextEffects wrapper."
arch=('any')
url="https://github.com/ggozad/textualeffects"
license=('MIT')
depends=(
	'python'
	'python-terminaltexteffects'
	'python-textual'
	'python-rich'
)
makedepends=(
	'python-installer'
	'uv'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ggozad/textualeffects/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver" || exit
	uvx --from build pyproject-build --installer uv
}

package() {
	cd "$_pkgname-$pkgver" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('4b09ac720d76eafa1136c58afcb0fb6fc79fad4d2370d9d23223012a90613ae736a58ceee16b01de0edf14c9611a0806b0db1f9d94bfdde9519d52cdbd61d9d7')
