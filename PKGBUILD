# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.9.1
pkgrel=9
pkgdesc="A very fast and convenient image viewer"
url="http://userbase.kde.org/KuickShow"
arch=('x86_64')
license=('GPL')
depends=('kdebase-runtime' 'imlib')
makedepends=('pkg-config' 'cmake' 'automoc4' 'docbook-xsl')
source=(http://hosti.leonde.de/~gis/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('9427a563cd48b968230743d73de74a1d802666e996866b365c2f52708d428850')

build() {
  cd "${srcdir}"

  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install
}
