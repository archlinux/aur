# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=python-json-logging
_pkgname=json-logging-python
pkgver=1.3.0
pkgrel=1
pkgdesc="Python logging library to emit JSON log that can be easily indexed and searched"
url="https://github.com/bobbui/json-logging-python"
depends=('python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("${url}/archive/${pkgver}.zip")
sha256sums=('cab9f956bf1f667587e3c28d634c7cb7849609111201fe205c246a0f0bf95d61')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
