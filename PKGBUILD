# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=kodi-addon-checker
pkgver=0.0.18
pkgrel=1
pkgdesc="Check kodi addons or whole kodi repositories for errors and best practices."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=('GPL3')
depends=('python' 'python-packaging' 'python-pillow' 'python-polib' 'python-requests' 'python-radon' 'python-urllib3' 'python-xmlschema')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('79447ff22e75f6703925e7fe6585ec99a82e6f7aa2a678f7c24e1ed2be46af2b')

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
