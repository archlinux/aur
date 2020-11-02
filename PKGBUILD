# Maintainer: pupmkincheshire <sollyonzou@gmail.com>
# Contributor: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares

pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.52
pkgrel=3
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-xlib' 'python-pymsgbox' 'python-pytweening' 'python-pyscreeze' 'python-mouseinfo')
optdepends=('tk: windowing tool kit' 'scrot: screenshot tool')
          # 'python-pygetwindow' - Not compatible with Linux yet
          # 'python-pillow' - is provided by mouseinfo
makedepends=('python' 'python-setuptools')
provides=('python-pyautogui')
conflicts=('python-pyautogui-git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a486cb6b818bcbcdf98b48d010c7cee964134fa394b756e8ce6e50d43b58ecc8')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
