# Maintainer: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>
pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.12.0
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
	cd "$_pkgname-release-$pkgver" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-release-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
b2sums=('5129a3c28666d4ab1dac500ce47bd06f0a52ab053d6b39f0b6c5c592c6c2958ff20b63a658bd6fda2130f925ebb424415f935ce96565bbfbd233384ff1eb6de4')
