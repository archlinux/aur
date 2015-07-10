# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.0.1
pkgrel=1
pkgdesc="The nice editor, a fast small powerful and simple to use editor"
arch=('i686' 'x86_64')
url="http://ne.di.unimi.it"
license=('GPL3')
depends=('ncurses' 'texinfo')
install="ne.install"
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('48787d0aa55f89fadbd6f7d6cc6eb1de')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
}
