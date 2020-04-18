# Maintainer: AnySomebody <anysomebody@gmx.de>

pkgname=python-rofi-git
_gitname=python-rofi
pkgver=r18.d20b3a2
pkgrel=2
pkgdesc="A Python module to make simple GUIs with Rofi"
arch=('any')
url="https://github.com/bcbnz/python-rofi"
license=('GPL')
conflicts=('python-rofi')
provides=('python-rofi')
makedepends=('git' 'python-setuptools' 'fakeroot')
depends=('python' 'rofi')

source=("git+https://github.com/bcbnz/python-rofi.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname/

  python setup.py build
}

package() {
  cd $_gitname/

  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}
