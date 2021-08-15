# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=cbm
pkgver=0.3.2
pkgrel=1
pkgdesc="Color Bandwidth Meter - display in real time the network traffic speed"
arch=('i686' 'x86_64')
url="https://github.com/resurrecting-open-source-projects/cbm"
license=('GPL2')
depends=('ncurses')
makedepends=('autoconf' 'automake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2014491b160bce82ac11558611f735f6fbeffcd6f5ae006ae0ab09cdd7f5c152')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
