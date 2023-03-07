# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vinicius Correa <vinicius dot correa at zoho dot com>

_pkgname=PyKCS11
pkgname=python-pykcs11
pkgver=1.5.11
pkgrel=1
pkgdesc="PKCS#11 wrapper for Python."
arch=('x86_64')
url="https://github.com/LudovicRousseau/pykcs11"
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'swig')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ef1d51a24eff9eb6c1288428996614316841e34bac2d59f483db0ed1a9cad044')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
