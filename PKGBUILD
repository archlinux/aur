# Maintainer kang <kang@insecure.ws>

pkgname=python-console-menu-git
_pkgname="console-menu"
pkgver=v0.6.0.r11.g93006cb
pkgrel=1
pkgdesc="A simple Python menu system for building terminal user interfaces."
arch=('any')
url="https://github.com/aegirhall/console-menu"
license=('MIT')
depends=('python' 'python-jose' 'python-requests')
makedepends=('git' 'python-setuptools')
source=('git://github.com/aegirhall/console-menu')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
}
