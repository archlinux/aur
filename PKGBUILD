# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.3.4
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=(aarch64 i686 x86_64)
url='http://ne.di.unimi.it'
license=(GPL-3.0-or-later)
depends=(ncurses texinfo)
source=("https://github.com/vigna/ne/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d96abc38f724d56d092a2c3d5c86e0abca2175c2180e17021e45d60a78de45cc14a8af75376ada8c2d78600fe75acd4edcfc70a1bf08f45fe1baf2e5092fc454')

build() {
  cd ${pkgname}-${pkgver}
  make -j1 PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
