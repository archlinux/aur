# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2020.7
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL' 'APACHE')
depends=('towncrier' 'python-setuptools' 'python-wheel' 'twine')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('74936d044f319cd7a9dca322b46a818fcb6e2af1c67af62e8a6a3121eb2863d2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
