# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=python-pyautogui-git
pkgver=r197.1256267
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings (git)"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-xlib' 'python-pillow' 'python-pyscreeze' 'python-pytweening' 'python-pymsgbox')
makedepends=('git' 'python-setuptools')
provides=('python-pyautogui')
conflicts=('python-pyautogui')
source=("${pkgname}"::'git+https://github.com/jose1711/pyautogui.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
