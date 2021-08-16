# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.3.1
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=(i686 x86_64)
url='http://ne.di.unimi.it'
license=(GPL3)
depends=(ncurses texinfo)
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4adce440c1d941e51cc688ab55f215013c30366e555dfe67f62494ade5ccf90ef4e3062b4bff023f3dcc8dda7f2bd89ad3f62632d51393d154b197eaf4856297')

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
