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
sha512sums=('277fe1779015b232fb638cc83901996f512687d838d03826f9f1033eca897283d052bf3d7a963cab4c27e040ca33fe166142bf49734b77a56053f54e46912147')

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
