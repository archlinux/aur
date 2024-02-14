# $Id$
# Maintainer: Jeremy Reed <reeje76@gmail.com>
# Contributor: Arthur Vuillard <arthur@hashbang.fr>

_pkgname="joe"
pkgname="joe-go"
pkgver="1.1.0"
pkgrel=3
pkgdesc="A .gitignore magician in your command line"
arch=('any')
url="http://github.com/jeremymreed/joe/"
license=('MIT')
depends=()
provides=('joe')
makedepends=('go')
conflicts=('python2-joe')
install=joe.install
source=("https://github.com/jeremymreed/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("e49c50676b1e4826af6cf6251bc933be6ccf5f010ac2ad051e8e8f705e43985c")

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./tool.sh deps
  ./tool.sh build
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/build/joe" "${pkgdir}/usr/bin/joe-gitignore"
}

# vim:set ts=2 sw=2 et:
