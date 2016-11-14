# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=caatinga-git
pkgver=1.1.1.r2.g4821af9
pkgrel=1
pkgdesc="A command line backup program written in Python - Git Version"
arch=('any')
url="https://github.com/headmastersquall/caatinga"
license=('GPL3')
depends=('python2-distribute')
makedepends=('git')
conflicts=('caatinga')
provides=('caatinga')
source=('git://github.com/headmastersquall/caatinga')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^caatinga-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd ${srcdir}/${pkgname%-git}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
