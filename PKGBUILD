# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: John D. Corrado <jdcorrado at gmail dot com>

pkgname=sopwith
_pkgname="sdl-${pkgname}"
pkgver=2.4.0
pkgrel=1
pkgdesc="Sidescrolling shoot 'em up game"
url="https://fragglet.github.io/sdl-sopwith/sshot.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl')
makedepends=('autoconf')
source=("https://github.com/fragglet/sdl-sopwith/archive/refs/tags/sdl-sopwith-${pkgver}.tar.gz")
sha256sums=('885350cdbc3a95e5986935690bec1e8ea84e4d2983c462eed9691ac216173f96')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  mkdir -p autotools
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
