# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tim Savannah <kata198@gmail.com>

pkgname=python-advancedhtmlparser
pkgver=9.0.1
pkgrel=1
pkgdesc="Indexed HTML parser"
arch=('any')
license=('LGPL3')
url="http://github.com/kata198/AdvancedHTMLParser"
depends=('python-queryablelist')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9ecdfdc7ba060c2e7fa231c06d144fe4b73cd116d8030404a83386ca3de384ac')

build() {
	cd "AdvancedHTMLParser-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "AdvancedHTMLParser-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
