# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.1.1
pkgrel=2
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=('i686' 'x86_64')
url='http://ne.di.unimi.it'
license=('GPL3')
depends=('ncurses' 'texinfo')
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1597b4eb06d0b8d88d233e5e623750c76fa5a43091d66a9e7c2270a4f36b7e8077a1146afa8a0c5454c8c22e7d3dcccde06e3526f12d36a3689455cfc143a42c')

build() {
  cd "${pkgname}-${pkgver}"
  export MAKEFLAGS="-j1"
  make PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
