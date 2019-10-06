# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.2.1
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=('i686' 'x86_64')
url='http://ne.di.unimi.it'
license=('GPL3')
depends=('ncurses' 'texinfo')
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('66def9f7b19fc19b7237344eb67c067b34f5cf9632b3b41440381371a220fd18ccb066e05b5147718060cb6d37c44d146041e1d0e7bd153a637727452887f6ad')

build() {
  cd "${pkgname}-${pkgver}"
  export MAKEFLAGS="-j1"
  make PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
