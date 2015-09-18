# Maintainer: 2ion
pkgname=advancecomp
pkgver=1.20
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
url='http://advancemame.sourceforge.net/comp-readme.html'
license=('GPL')
depends=('zlib' 'gcc-libs')
makedepends=()
source=("https://github.com/amadvance/advancecomp/releases/download/v${pkgver}/advancecomp-${pkgver}.tar.gz")
sha256sums=('590a447cfc7ab3a37ec707e13967a0046a81a888c561ebaff5415b1e946da67b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
