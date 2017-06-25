# Maintainer: 2ion
pkgname=advancecomp
pkgver=2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
url='http://advancemame.sourceforge.net/comp-readme.html'
license=('GPL')
depends=('zlib' 'gcc-libs')
makedepends=()
source=("https://github.com/amadvance/advancecomp/releases/download/v${pkgver}/advancecomp-${pkgver}.tar.gz")
sha256sums=('10432e8e95395926723b6a7ef9bcf595eb2d53853a24f1e65154e80970122685')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 HISTORY "$pkgdir"/usr/share/doc/advancecomp/HISTORY
}
