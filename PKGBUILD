# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=kodi-addon-checker
pkgver=0.0.20
pkgrel=1
pkgdesc="Check kodi addons or whole kodi repositories for errors and best practices."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-packaging' 'python-pillow' 'python-polib' 'python-requests' 'python-radon' 'python-urllib3' 'python-xmlschema')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a3edc3b88d5fcbea725ac33d5cba1291a39323b3f2ca94a4c9fc6a50a180da1')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
