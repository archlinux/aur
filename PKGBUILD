# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=python-easyansi
_name=easy-ansi
pkgver=0.3
pkgrel=1
pkgdesc="Easy ANSI is a terminal framework API to give you an easy way to use colors, cursor control movements, and line/box drawing."
arch=('any')
url="https://gitlab.com/easy-ansi/easy-ansi"
license=('MIT')
depends=()
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d7e1b7cc34ec3f0032405925c8ea0713e6f18099ca6abfe3436c99951169361a')

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
