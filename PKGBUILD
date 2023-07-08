# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-kodistubs
_name=Kodistubs
pkgver=20.0.1
pkgrel=1
pkgdesc="Stub modules that re-create Kodi Python API"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5b56e2ac09336350c365959997deccf6842cf4adff70ed032496c7b1f72f60fd')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
