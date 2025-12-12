# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: John D. Corrado <jdcorrado at gmail dot com>

pkgname=sopwith
_pkgname="sdl-${pkgname}"
pkgver=2.9.0
pkgrel=1
pkgdesc="Sidescrolling shoot 'em up game"
url="https://fragglet.github.io/sdl-sopwith/sshot.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl')
makedepends=('autoconf')
source=("https://github.com/fragglet/sdl-sopwith/archive/refs/tags/sdl-sopwith-${pkgver}.tar.gz")
sha256sums=('f46e3a4ad6a1cc9a8d1ced01bd29b6a0a46d64852bd97014194fc42ed049efa9')

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
