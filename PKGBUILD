# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.3.3
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=(aarch64 i686 x86_64)
url='http://ne.di.unimi.it'
license=(GPL3)
depends=(ncurses texinfo)
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('977c5497c213526f796bbba540dbeb585eca248d5eded41063ceb57981a33b7d1954ae1c7a39287ff88288a05d7811630ca887e8ef7f08f237d19a9ba4be2d29')

build() {
  cd ${pkgname}-${pkgver}
  make -j1 PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
