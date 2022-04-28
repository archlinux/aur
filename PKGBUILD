# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-kodistubs
_name=Kodistubs
pkgver=19.0.3
pkgrel=1
pkgdesc="Stub modules that re-create Kodi Python API"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d6f3379712fa944704dbb74e49b64fbc32ecc8dbfb5433221f4115e927f5b318')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
