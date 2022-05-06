# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=python-duckling
pkgdesc="Python wrapper for wit.ai's Duckling Clojure library"
pkgver=1.8.0
pkgrel=3
url="https://github.com/FraBle/python-duckling"
license=('Apache')
arch=('any')
depends=('java-runtime' 'python-jpype1' 'python-dateutil' 'python-six')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc13c0ad738daf377f37dbfb101a46f6c637a9eb814fec1c229337c8d279e7ca')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
