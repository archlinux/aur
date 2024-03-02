# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tim Savannah <kata198@gmail.com>

pkgname=python-advancedhtmlparser
pkgver=9.0.2
pkgrel=1
pkgdesc="Indexed HTML parser"
arch=('any')
license=('LGPL3')
url="http://github.com/kata198/AdvancedHTMLParser"
depends=('python-queryablelist')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ba2ba4a70a6b7cf769b34b0e981bc5646632a1cd76ad4ca31c3b7b79eb8df9cd')

build() {
	cd "AdvancedHTMLParser-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "AdvancedHTMLParser-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
