# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_name=godirect
pkgname=python-$_name
pkgver=1.1.2
pkgrel=1
pkgdesc='Library to interface with GoDirect devices via USB and BLE'
arch=(any)
url='https://pypi.org/project/godirect'
license=(GPL)
depends=(python-hidapi python-bleak)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6f91ab46944857fdb93e9d1444bb6f1b77b8e0d122f551f686a43573dbe9299e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
