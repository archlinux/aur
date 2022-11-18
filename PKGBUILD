# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Mario Rodas <marsam at users dot noreply dot github dot com>

pkgname=lightning
pkgver=2.2.0
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('4e3984ff1ccf0ba30a985211d40fc5c06b25f014ebdf3d80d0fe3d0c80dd7c0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
