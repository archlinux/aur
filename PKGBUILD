# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>
pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.11.0
pkgrel=1
pkgdesc='Visual effects engine applied to text in the terminal. '
url="https://github.com/ChrisBuilds/terminaltexteffects"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry-core')
provides=('terminaltexteffects')
conflicts=('terminaltexteffects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisBuilds/terminaltexteffects/archive/refs/tags/release-$pkgver.tar.gz")

build() {
	cd "$_pkgname-release-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-release-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/$_pkgname-release-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
b2sums=('5647c695ef36ba3ff2ae9a535dc54b1189ca0be53a6479528d4a223d67d91d2fc4f5e06d4325d8f18d81cc79b53ec21a3c9173b319612b8f0c8c8b804b4b60b4')
