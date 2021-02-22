# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=kodi-addon-checker
pkgver=0.0.23
pkgrel=1
pkgdesc="Check kodi addons or whole kodi repositories for errors and best practices."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-packaging' 'python-pillow' 'python-polib' 'python-requests' 'python-radon' 'python-urllib3' 'python-xmlschema')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('830f0072e2c1467798c7d82150a8264f0a0d44b8a7a106a1aea4266a292e08f7')

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
