# Maintainer: Gunnar Bretthauer <taijian@posteo.de>

pkgname=python-json-logging
_pkgname=json-logging-python
pkgver=1.2.11
pkgrel=1
pkgdesc="Python logging library to emit JSON log that can be easily indexed and searched"
url="https://github.com/bobbui/json-logging-python"
depends=('python')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("${url}/archive/${pkgver}.zip")
sha256sums=('9045fb0821e3f92fdea16102f4703d1ae871386c824fca21e36398d03d1ee23f')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
