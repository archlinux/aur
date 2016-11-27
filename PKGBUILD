# Maintainer: 2ion
pkgname=advancecomp
pkgver=1.23
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
url='http://advancemame.sourceforge.net/comp-readme.html'
license=('GPL')
depends=('zlib' 'gcc-libs')
makedepends=()
source=("https://github.com/amadvance/advancecomp/releases/download/v${pkgver}/advancecomp-${pkgver}.tar.gz")
sha256sums=('75a2c97ab0cd53e71b6a3dd7f07c001fa02351c9d781a4c586718f7fea3e88ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
