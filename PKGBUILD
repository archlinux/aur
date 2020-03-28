# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares
pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.49
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-pymsgbox' 'python-pyscreeze' 'python-pytweening' 'python-mouseinfo')
          # 'python-pygetwindow' - Not compatible with Linux yet
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2c9182e6eb73a764a60e3d7c8d1877f3b470ceffacb84d70f6569e219a2fc5c5')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
