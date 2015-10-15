# Maintainer: Philippe Loctaux <loctauxphilippe@gmail.com>

pkgname=crand
pkgver=0.4.1
pkgrel=1
pkgdesc="Randomizer of text strings"
arch=('i686' 'x86_64')
url="https://github.com/loctauxphilippe/${pkgname}"
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://github.com/loctauxphilippe/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('52e6d1abc75ff136dcdda9ab125e4305')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
