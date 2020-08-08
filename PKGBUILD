# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-i18n
pkgver=0.3.7
pkgrel=1
pkgdesc="Easy to use i18n library for Python"
arch=('any')
url="https://github.com/danhper/python-i18n"
license=('GPL')
depends=('python-yaml' 'python-coveralls')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('095cb67a449f9caaddb4ca034255dcb442b1d1aca874294eda537bb5ea919892'
            'SKIP')
validpgpkeys=('1FEFF6D65203687AC33771CDA0B4CCFEBD33E18A') # Daniel Perez <tuvistavie@gmail.com>


build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
