# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_name=cello
_Name=Cello
pkgname=lib${_name}
pkgver=2.0.3
pkgrel=1
pkgdesc='cello is a library that brings higher level programming to C'
arch=('i686' 'x86_64')
url="http://libcello.org/"
license=('BSD')
makedepends=('gcc')
source=("https://github.com/orangeduck/${_Name}/archive/v${pkgver}.tar.gz")
sha256sums=('1afcae06f5efc10ea161737a862073ff5679c964540bca7cd719539609d0633c')

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
