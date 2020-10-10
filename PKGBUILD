# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares
pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.52
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-pymsgbox' 'python-pyscreeze' 'python-pytweening' 'python-mouseinfo')
          # 'python-pygetwindow' - Not compatible with Linux yet
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a486cb6b818bcbcdf98b48d010c7cee964134fa394b756e8ce6e50d43b58ecc8')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
