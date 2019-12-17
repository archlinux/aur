# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=cello
_Name=Cello
pkgname=lib${_name}
pkgver=2.1.0
pkgrel=1
pkgdesc='cello is a library that brings higher level programming to C'
arch=('i686' 'x86_64')
url="http://libcello.org/"
license=('BSD')
makedepends=('gcc')
source=("https://github.com/orangeduck/${_Name}/archive/${pkgver}.tar.gz")
sha256sums=('c138d974325fcb9640307c8b2d5dcc2d7127a1ccc5589d6c0794f86a5cb4001d')

build() {
  cd "${srcdir}/${_Name}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_Name}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_Name}-${pkgver}"
  PREFIX="${pkgdir}/usr" make install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
