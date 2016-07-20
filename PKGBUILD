# Maintainer: Stefan Mayer <stevijo.mayer@gmail.com>
pkgname=gimx
pkgver=5.8
pkgrel=1
pkgdesc="Game Input Mulitplexer"
arch=('i686' 'x86_64')
url="http://blog.gimx.fr/"
license=('GPLv3')
depends=('wxgtk2.8' 'ncurses' 'xterm' 'xdg-utils' 'curl' 'openssl' 'libx11' 'libxi' 'mhash' 'bluez-libs' 'curl')
makedepends=('gettext')
source=(https://github.com/matlo/GIMX/archive/v${pkgver}.tar.gz
        0001-arch-changes.patch)
sha256sums=('bc2f035f00d49007c2221d08b2343cd0dc397e4135f6c8bc0d1418b7dc006510'
            '1b5bd330825baea2e44367bbc59029d9cf47d68c5643b45b0631e9e16f35e3a7')

prepare() {
  cd ${srcdir}/GIMX-${pkgver}
  patch -p1 < ../0001-arch-changes.patch
}

build() {
  cd ${srcdir}/GIMX-${pkgver}
  make
}

package() {
  cd ${srcdir}/GIMX-${pkgver}
  make install DESTDIR=${pkgdir}
}
