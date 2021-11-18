# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=caatinga-git
pkgver=1.1.1.r2.g4821af9
pkgrel=3
pkgdesc="A command line backup program written in Python - Git Version"
arch=('any')
url="https://github.com/headmastersquall/caatinga"
license=('GPL3')
makedepends=('git' 'python-setuptools')
conflicts=('caatinga')
provides=('caatinga')
source=('git+https://github.com/headmastersquall/caatinga')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^caatinga-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
