# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=python-textualeffects
_pkgname=textualeffects
pkgver=0.1.4
pkgrel=1
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
b2sums=('ace677eba2fdd9d3c6f265ff81807b5a76e6167ad4a2128ffec0ad9362e0a41d54f300aeeb4e853800a40640627724fc563038b3b5a41968fe59f6a4d0fa08f8')
