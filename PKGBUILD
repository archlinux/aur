# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=kodi-addon-checker
pkgver=0.0.13
pkgrel=1
pkgdesc="Check kodi addons or whole kodi repositories for errors and best practices."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-polib' 'python-requests' 'python-radon' 'python-urllib3' 'python-xmlschema' 'python-tabulate')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d01b3b0ded83d92c3e78507ec79c5adca93538457114d52eb5963ec63dc0ea02')

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
