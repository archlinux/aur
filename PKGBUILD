# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=python-rich-rst
_name=rich_rst
pkgver=1.3.2
pkgrel=1
pkgdesc="A reStructuredText renderer for rich "
arch=('any')
url="https://github.com/wasi-master/rich-rst"
license=('MIT')
depends=('python-docutils' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://github.com/wasi-master/rich-rst/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('605230b5e36dfa4e2ef45d7b2951a42a4987ad69a86f4cb7e079daa84d4a04dd')

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
