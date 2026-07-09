# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=python-rich-rst
_name=rich_rst
pkgver=2.1.0
pkgrel=1
pkgdesc="A reStructuredText renderer for rich "
arch=('any')
url="https://github.com/wasi-master/rich-rst"
license=('MIT')
depends=('python-rich' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/wasi-master/rich-rst/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('134f8d18e1391795fa32154af984202cb088738e6f75b26b8e0324996265fe5b')

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
