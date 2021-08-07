# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=cbm
pkgver=0.3.1
pkgrel=1
pkgdesc="Color Bandwidth Meter - display in real time the network traffic speed"
arch=('i686' 'x86_64')
url="https://github.com/resurrecting-open-source-projects/cbm"
license=('GPL2')
depends=('ncurses')
makedepends=('autoconf' 'automake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('63e7222e0a8023116f2dc1819c32c6fd9b415af76c670fc49438a403b03f0650')

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
