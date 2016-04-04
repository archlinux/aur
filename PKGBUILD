# $Id$
# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

pkgname="joe"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A .gitignore magician in your command line"
arch=('any')
url="http://github.com/karan/joe/"
license=('MIT')
depends=()
provides=('joe')
makedepends=('go')
conflicts=('python2-joe')
install=joe.install
source=("https://github.com/karan/joe/archive/${pkgver}.tar.gz")
md5sums=('c25449256943af69a4444488e867995d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  GOPATH=${srcdir}/${pkgname}-${pkgver} go get github.com/codegangsta/cli
  GOPATH=${srcdir}/${pkgname}-${pkgver} go build -o build/joe joe.go utils.go
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/${pkgname}-${pkgver}/build/joe ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
