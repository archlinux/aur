# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Riccardo Berto <riccardo at rcrdbrt dot com>

pkgname=python-cloudant
_name=cloudant
pkgver=2.15.0
pkgrel=1
pkgdesc="Cloudant / CouchDB Client Library"
license=('Apache')
arch=('any')
url="https://github.com/cloudant/python-cloudant"
depends=('python-requests>=2.7.0')
makedepends=('python-setuptools')
install=cloudant.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ac2f5136e4f8fba5c838643603b5272c5cfb6ed2240edb580fe3c2c5a5fcda63')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
