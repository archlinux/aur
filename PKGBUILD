# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.3.0
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=('i686' 'x86_64')
url='http://ne.di.unimi.it'
license=('GPL3')
depends=('ncurses' 'texinfo')
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2bdaf7aa30f0d997cc4e21ad79cd3aafaf4a7df450ffc1ee8129f76450875ed1140c6601ef0b568e1bbc0ee4f40c05305a83d9e303a97fb2ce02d01a56a46a05')

build() {
  cd "${pkgname}-${pkgver}"
  export MAKEFLAGS="-j1"
  make PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
