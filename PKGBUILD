# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-kodistubs
_name=Kodistubs
pkgver=20.0.0
pkgrel=2
pkgdesc="Stub modules that re-create Kodi Python API"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dd8d578063cf8aca70eae182494c4167ce945c32d7640d2e004a5c374d6e8e16')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
