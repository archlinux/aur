# Maintainer: mickele

pkgname=cba
pkgver=0.3.6
pkgrel=1
pkgdesc='Continuous beam analysis - calculates member forces and support reactions of a continuous beam'
arch=('i686' 'x86_64')
url='http://cbeam.sourceforge.net/'
license=('GPL3')
depends=('wxgtk')
makedepends=()
options=()
install=
source=("http://downloads.sourceforge.net/sourceforge/cbeam/cba-${pkgver}-linux.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -e "s|-lstdc++| -lstdc++ -lm|" -i src/gui/Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"

  make DESTDIR="${pkgdir}" install
}

md5sums=('ef9d12b03918e8b75fdc3b1525412b5c')
