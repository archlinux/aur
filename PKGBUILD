# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandra Koch <alexandra@alexandrakoch.se>

pkgname=python-registry
pkgver=1.4
pkgrel=1
pkgdesc="Python library for reading Windows Registry files"
arch=('any')
url="https://github.com/williballenthin/python-registry"
license=('Apache')
depends=('python-unicodecsv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGELOG.TXT
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8fdd7d6d3260a904690fac557a2a35c0056feadc45ac4f17d6475f03b23f9df6')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
