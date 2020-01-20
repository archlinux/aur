# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares
pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.48
pkgrel=2
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-pymsgbox' 'python-pyscreeze' 'python-pytweening' 'python-mouseinfo')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e91a25c1cdf826e7d0581775b5fbe47f7e12af79e0eb9dc3e1488ba99f2e0c60')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
