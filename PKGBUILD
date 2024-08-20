# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=python-rich-rst
_name=rich_rst
pkgver=1.3.1
pkgrel=1
pkgdesc="A reStructuredText renderer for rich "
arch=('any')
url="https://github.com/wasi-master/rich-rst"
license=('MIT')
depends=('python-docutils' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://github.com/wasi-master/rich-rst/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('fad46e3ba42785ea8c1785e2ceaa56e0ffa32dbe5410dec432f37e4107c4f383')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
