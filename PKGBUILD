# Maintainer: 2ion <dev at 2ion dot de>
pkgname=advancecomp
pkgver=1.19
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip agorithm"
url="http://advancemame.sourceforge.net/comp-readme.html"
license=('GPL')
depends=('zlib')
makedepends=()
source=("http://downloads.sourceforge.net/project/advancemame/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('894c2db01c9fff40257f929496621bdcea77748b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
