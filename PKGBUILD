# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-speak
pkgver=0.1
pkgrel=2
pkgdesc="Simple class to create speech files using Google Translate URL"
arch=('any')
url="https://github.com/marcus67/python_google_speak"
license=('GPL3')
depends=('python-requests' 'python-playsound' 'python-pygi')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bd9b8d4968cad94b3e614c8c09b703bbf27dd2377036f5994761f8c7ef5fb69d')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
