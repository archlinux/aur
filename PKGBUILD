# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=rich-cli
_name=rich-cli
pkgver=1.8.0
pkgrel=1
pkgdesc="Rich-cli is a command line toolbox for fancy output in the terminal "
arch=('any')
url="https://github.com/Textualize/rich-cli"
license=('MIT')
depends=('python-textual' 'python-rich' 'python-click' 'python-requests' 'python-textual' 'python-rich-rst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7f99ed213fb18c25999b644335f74d2be621a3a68593359e7fc62e95fe7e9a8a')

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
