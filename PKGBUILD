# Maintainer: Stefan Mayer <stevijo.mayer@gmail.com>
pkgname=gimx
pkgver=5.5
pkgrel=1
pkgdesc="Game Input Mulitplexer"
arch=('i686' 'x86_64')
url="http://blog.gimx.fr/"
license=('GPLv3')
depends=('wxgtk2.8' 'ncurses' 'xterm' 'xdg-utils' 'curl' 'openssl' 'libx11' 'libxi' 'mhash' 'bluez-libs' 'curl')
makedepends=('gettext')
source=(https://github.com/matlo/GIMX/archive/v${pkgver}.tar.gz
        0001-arch-changes.patch)
sha256sums=('b7be0d733cea098f008e3340d2aec6180956ebaef3559397a7a70bbf076c962e'
            'SKIP')

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
