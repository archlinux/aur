# Maintainer: bonob <bonob at fastmail dot com>

pkgname=python-pytoolconfig
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=2
pkgdesc="Manage configuration for python tools, such as black and rope."
arch=('any')
url="https://pypi.org/project/pytoolconfig/"
license=('LGPL3')
depends=('python>=3.8' 'python-tomli' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm')
_dlurl="https://files.pythonhosted.org/packages/source"
source=("$_dlurl/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('778a74212a53c2bd3573246587139f10')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
